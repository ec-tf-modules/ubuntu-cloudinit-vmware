output "vm_id" {
  description = "The ID of the provisioned virtual machine"
  value       = vsphere_virtual_machine.vm.id
}

output "vm_name" {
  description = "The name of the provisioned virtual machine"
  value       = vsphere_virtual_machine.vm.name
}

output "vm_ip" {
  description = "The default IP address of the provisioned virtual machine"
  value       = vsphere_virtual_machine.vm.default_ip_address
}

output "resource_pool_id" {
  description = "The resource pool ID where the virtual machine was placed"
  value       = vsphere_virtual_machine.vm.resource_pool_id
}
