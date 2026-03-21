# Deployment Guide

This guide describes how to deploy the virtual machine using Terraform. The deployment automatically provisions an admin user, installs essential packages immediately on first boot, and supports both DHCP and manual static IP network configurations.

## Step 1: Prepare the Content Library

Ensure you have a modern Ubuntu OVA image (e.g., Ubuntu 22.04 LTS) in your vSphere Content Library. The OVA should be an OVF item type.

## Step 2: Configure variables

Create a `terraform.tfvars` file and fill in the required variables.

> [!NOTE]
> An example module is available in the `examples/basic` directory. You can test your Terraform variables by running the example calling Terraform snippet (`main.tf`) found there. You can also find helper scripts in that directory to set environment variables securely without writing a `terraform.tfvars` file:
> - **Windows Users**: Copy `Set-TerraformVars.example.ps1`, tailor it to your needs, and use it to test the module.
> - **Linux/macOS Users**: Copy `set-terraform-vars.example.sh`, tailor it to your needs, and source it (`source set-terraform-vars.sh`) to test the module.

```hcl
vsphere_user           = "administrator@vsphere.local"
vsphere_password       = "your-password"
vsphere_server         = "vcenter.example.com"
datacenter_name        = "Datacenter"
cluster_name           = "Cluster"
datastore_name         = "Datastore"
network_name           = "VM Network"
content_library_name   = "Content Library"
content_library_item_name = "noble-server-cloudimg-amd64"
vm_name                = "ubuntu-test-vm"
vm_user_ssh_keys       = ["ssh-rsa ..."]
```

## Step 3: Run Terraform commands

Run the following commands in the project directory:

```bash
# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the deployment
terraform apply
```

## Troubleshooting

- **No guest customization support**: Some older OVAs do not support vApp properties. If cloud-init doesn't run, check the OVA information in vSphere.
- **Provider initialization error**: Check your vCenter URL and credentials.
- **Content library item not found**: Verify the exact name of the item in vSphere.
