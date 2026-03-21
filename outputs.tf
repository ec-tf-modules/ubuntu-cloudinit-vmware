output "vm_name" {
  description = "The name of the provisioned virtual machine"
  value       = vsphere_virtual_machine.vm.name
}

output "vm_ip" {
  description = "The default IP address of the provisioned virtual machine"
  value       = vsphere_virtual_machine.vm.default_ip_address
}
