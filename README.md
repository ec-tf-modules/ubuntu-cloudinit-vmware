# vSphere Ubuntu OVA Deployment with Cloud-Init

This project provides Terraform code to deploy an Ubuntu virtual machine from an OVA image stored in a vSphere Content Library, using cloud-init for guest customization.

## Features

- **Content Library Integration**: Deploys directly from an OVA in a Content Library.
- **Cloud-Init Customization**: Automatically configures the VM hostname, provisions an admin user (with a plain text password and one or more SSH keys), and installs essential system packages immediately upon first boot.
- **Flexible Networking**: The VM can be configured with a network address assigned dynamically via DHCP or defined manually with static IP settings.
- **Open-VM-Tools**: Ensures the guest agent is installed and enabled for better vSphere integration.

> [!NOTE]
> This module specifically configures the admin user with a plain text password and one or more SSH keys.

## Prerequisites

- Terraform >= 1.0.0
- vSphere Provider >= 2.0.2
- An Ubuntu OVA image uploaded to a vSphere Content Library.
- vCenter credentials and infrastructure details.

## Limitations & Important Notes

- **Content Library Requirement**: This module strictly requires the OVA image to pre-exist in a vSphere Content Library. 
- **Untested Configurations**: Using a datastore file directly as the source of the OVA, or using datastore clusters instead of specific datastores, has not been tested and might not work as expected.


## Usage

1. **Clone the repository** (or copy the files).
2. **Configure variables**:

   > [!NOTE]
   > You can find a working example in the `examples/basic` module. You can use the provided helper scripts (`Set-TerraformVars.example.ps1` for Windows or `set-terraform-vars.example.sh` for bash users) to securely inject variables via environment. Tailor them to your needs to test the module.

   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```
   Edit `terraform.tfvars` with your specific vSphere details.
3. **Initialize Terraform**:
   ```bash
   terraform init
   ```
4. **Plan and Apply**:
   ```bash
   terraform plan
   ```
   If everything looks correct, apply the changes:
   ```bash
   terraform apply
   ```

## Files

- `main.tf`: Data sources and VM resource definition.
- `variables.tf`: Input variable definitions.
- `provider.tf`: vSphere provider configuration.
- `versions.tf`: Required Terraform and provider versions.
- `outputs.tf`: VM name and IP address output.
- `cloud-init/userdata.yaml`: Cloud-init template.
- `examples/`: Contains examples of how to consume this module.
- `docs/`: Additional project documentation, including deployment guides.
- `GEMINI.md`: Contains project-specific rules, guidelines, and context (such as coding standards and documentation requirements) specifically intended for AI assistants like Gemini to follow when contributing to the repository.
- `LICENSE`: The BSD 3-Clause License terms.
- `TODO.md`: List of future features, enhancements, or pending tasks.
## License

This project is licensed under the BSD 3-Clause License. See the `LICENSE` file for details.
