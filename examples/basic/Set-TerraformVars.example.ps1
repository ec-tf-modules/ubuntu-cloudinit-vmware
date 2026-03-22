# Set-TerraformVars.ps1
# This script initializes Terraform environment variables (TF_VAR_*)
# for the current PowerShell session.
# 
# IMPORTANT: This file contains secrets and is excluded from git sync.
# DO NOT COMMIT THIS FILE TO VERSION CONTROL.

# vCenter Credentials & Connection
$env:TF_VAR_vsphere_server = "vcenter.example.com"
$env:TF_VAR_vsphere_user = "administrator@vsphere.local"
$env:TF_VAR_vsphere_password = "your-password"

# vSphere Infrastructure Details
$env:TF_VAR_datacenter_name = "Datacenter"
$env:TF_VAR_cluster_name = "Cluster"
$env:TF_VAR_datastore_name = "Datastore"
$env:TF_VAR_network_name = "VM Network"

# Content Library Configuration
$env:TF_VAR_content_library_name = "Content Library"
$env:TF_VAR_content_library_item_name = "noble-server-cloudimg-amd64"

# VM Configuration
$env:TF_VAR_vm_name = "ubuntu-test-vm"
$env:TF_VAR_vm_folder = "Workloads/TestVMs"
$env:TF_VAR_vm_firmware            = "bios"
$env:TF_VAR_vm_cpu                 = 2
$env:TF_VAR_vm_memory              = 4096
$env:TF_VAR_vm_disk_size           = 20
$env:TF_VAR_vm_user_ssh_keys = '["ssh-rsa AAAAB3N ..."]'
$env:TF_VAR_vm_user = "ubuntu"
$env:TF_VAR_vm_user_password = "your-password"

# VM Static Networking (Optional, leave empty for DHCP)
$env:TF_VAR_vm_ip = "192.168.1.100"
$env:TF_VAR_vm_netmask = "24"
$env:TF_VAR_vm_gateway = "192.168.1.1"
$env:TF_VAR_vm_dns = '["8.8.8.8", "8.8.4.4"]'
$env:TF_VAR_vm_dns_search = '["example.com"]'
$env:TF_VAR_vm_interface_name = "ens192"

Write-Host "Terraform environment variables have been set for the current session." -ForegroundColor Green
Write-Host "You can now run 'terraform plan' or 'terraform apply'." -ForegroundColor White
