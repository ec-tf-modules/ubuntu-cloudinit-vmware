# set-terraform-vars.sh
# This script initializes Terraform environment variables (TF_VAR_*)
# for the current bash session.
# 
# IMPORTANT: This file contains secrets and is excluded from git sync.
# DO NOT COMMIT THIS FILE TO VERSION CONTROL.

# vCenter Credentials & Connection
export TF_VAR_vsphere_server="vcenter.example.com"
export TF_VAR_vsphere_user="administrator@vsphere.local"
export TF_VAR_vsphere_password="your-password"

# vSphere Infrastructure Details
export TF_VAR_datacenter_name="Datacenter"
export TF_VAR_cluster_name="Cluster"
export TF_VAR_datastore_name="Datastore"
export TF_VAR_network_name="VM Network"

# Content Library Configuration
export TF_VAR_content_library_name="Content Library"
export TF_VAR_content_library_item_name="noble-server-cloudimg-amd64"

# VM Configuration
export TF_VAR_vm_name="ubuntu-test-vm"
export TF_VAR_vm_folder="Workloads/TestVMs"
export TF_VAR_vm_firmware="bios"
export TF_VAR_vm_cpu=2
export TF_VAR_vm_memory=4096
export TF_VAR_vm_user_ssh_keys='["ssh-rsa AAAAB3N ..."]'
export TF_VAR_vm_user="ubuntu"
export TF_VAR_vm_user_password="your-password"

# VM Static Networking (Optional, leave empty for DHCP)
export TF_VAR_vm_ip="192.168.1.100"
export TF_VAR_vm_netmask="24"
export TF_VAR_vm_gateway="192.168.1.1"
export TF_VAR_vm_dns='["8.8.8.8", "8.8.4.4"]'
export TF_VAR_vm_dns_search='["example.com"]'
export TF_VAR_vm_interface_name="ens192"

echo -e "\e[32mTerraform environment variables have been set for the current session.\e[0m"
echo -e "\e[37mYou can now run 'terraform plan' or 'terraform apply'.\e[0m"
