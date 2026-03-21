data "vsphere_datacenter" "datacenter" {
  name = var.datacenter_name
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_content_library" "library" {
  name = var.content_library_name
}

data "vsphere_content_library_item" "item" {
  name       = var.content_library_item_name
  library_id = data.vsphere_content_library.library.id
  type       = "ovf"
}

resource "vsphere_virtual_machine" "vm" {
  name                    = var.vm_name
  resource_pool_id        = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id            = data.vsphere_datastore.datastore.id
  folder                  = var.vm_folder
  firmware                = var.vm_firmware
  efi_secure_boot_enabled = var.vm_firmware == "efi" ? true : false

  num_cpus = var.vm_cpu
  memory   = var.vm_memory
  guest_id = "ubuntu64Guest" # Adjust if needed

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label            = "disk0"
    size             = 20 # Minimum size, OVA might have its own
    thin_provisioned = true
  }

  clone {
    template_uuid = data.vsphere_content_library_item.item.id
  }

  cdrom {
    client_device = true
  }

  extra_config = {
    "guestinfo.userdata" = base64encode(templatefile("${path.module}/cloud-init/userdata.yaml", {
      vm_user_ssh_keys= var.vm_user_ssh_keys
      hostname        = var.vm_name
      username        = var.vm_user
      password        = var.vm_user_password
    }))
    "guestinfo.userdata.encoding" = "base64"
    "guestinfo.metadata" = base64encode(yamlencode({
      instance-id    = var.vm_name
      local-hostname = var.vm_name
      network = {
        version = 2
        ethernets = {
          primary = {
            match = {
              name = "en*" # Matches ens33, ens160, eth0, etc.
            }
            dhcp4 = var.vm_ip == null ? true : false
            addresses = var.vm_ip != null ? ["${var.vm_ip}/${var.vm_netmask}"] : null
            nameservers = {
              addresses = var.vm_dns
              search    = var.vm_dns_search
            }
            routes = var.vm_gateway != null ? [
              {
                to  = "default"
                via = var.vm_gateway
              }
            ] : null
          }
        }
      }
    }))
    "guestinfo.metadata.encoding" = "base64"
  }

  # Wait for IP if DHCP (vm_ip is null), otherwise skip wait
  wait_for_guest_net_timeout = var.vm_ip == null ? 5 : 0
}
