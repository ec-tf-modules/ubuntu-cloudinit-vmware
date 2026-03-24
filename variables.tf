variable "datacenter_name" {
  description = "The name of the vSphere datacenter"
  type        = string
}

variable "cluster_name" {
  description = "The name of the vSphere compute cluster"
  type        = string
}

variable "datastore_name" {
  description = "The name of the vSphere datastore"
  type        = string
}

variable "network_name" {
  description = "The name of the vSphere network"
  type        = string
}

variable "content_library_name" {
  description = "The name of the vSphere content library"
  type        = string
}

variable "content_library_item_name" {
  description = "The name of the content library item (OVA)"
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine to create"
  type        = string
}

variable "vm_folder" {
  description = "The folder to place the virtual machine in"
  type        = string
  default     = null
}

variable "vm_firmware" {
  description = "The firmware for the virtual machine (bios or efi)"
  type        = string
  default     = "bios"
}

variable "vm_hw_version" {
  description = "The hardware version of the virtual machine (minimum 13 is required for EFI and SecureBoot)"
  type        = number
  default     = 10
}

variable "vm_cpu" {
  description = "The number of CPUs for the virtual machine"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "The amount of memory for the virtual machine (in MB)"
  type        = number
  default     = 4096
}

variable "vm_disk_size" {
  description = "The size of the virtual machine disk (in GB)"
  type        = number
  default     = 20
}

variable "vm_user_ssh_keys" {
  description = "A list of SSH public keys to add to the default user"
  type        = list(string)
  default     = []
}

variable "vm_interface_name" {
  description = "The network interface name (e.g., ens192)"
  type        = string
  default     = "ens192"
}

variable "vm_ip" {
  description = "The static IP address for the VM (leave null for DHCP)"
  type        = string
  default     = null
}

variable "vm_netmask" {
  description = "The netmask for the static IP (e.g., 24)"
  type        = number
  default     = 24
}

variable "vm_gateway" {
  description = "The gateway for the static IP"
  type        = string
  default     = null
}

variable "vm_dns" {
  description = "The DNS servers for the VM"
  type        = list(string)
  default     = ["8.8.8.8", "8.8.4.4"]
}

variable "vm_dns_search" {
  description = "The DNS search domains for the VM"
  type        = list(string)
  default     = []
}

variable "vm_user" {
  description = "The name of the default admin user"
  type        = string
  default     = "ubuntu"
}

variable "vm_user_password" {
  description = "The password for the admin user"
  type        = string
  sensitive   = true
  default     = null
}
