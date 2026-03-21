terraform {
  required_providers {
    vsphere = {
      source  = "vmware/vsphere"
      version = ">= 2.12.0"
    }
  }
}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

module "ubuntu_vm" {
  source = "../../"

  datacenter_name           = var.datacenter_name
  cluster_name              = var.cluster_name
  datastore_name            = var.datastore_name
  network_name              = var.network_name
  content_library_name      = var.content_library_name
  content_library_item_name = var.content_library_item_name

  vm_name     = var.vm_name
  vm_folder   = var.vm_folder
  vm_firmware = var.vm_firmware
  vm_cpu      = var.vm_cpu
  vm_memory   = var.vm_memory

  vm_user_ssh_keys  = var.vm_user_ssh_keys
  vm_user           = var.vm_user
  vm_user_password  = var.vm_user_password
  vm_interface_name = var.vm_interface_name
  
  vm_ip         = var.vm_ip
  vm_netmask    = var.vm_netmask
  vm_gateway    = var.vm_gateway
  vm_dns        = var.vm_dns
  vm_dns_search = var.vm_dns_search
}
