# Documentation guide

- Place a project description file in ./README.md, formatted in Markdown format.
- Write additional project documentation in the ./docs folder, formatted in Markdown format.
- Keep documentation up to date with the latest changes.
- All shell commands must be documented.

# Security guide

# Testing guide

# Deployment guide

# Maintenance guide

# Troubleshooting guide

# Performance guide

# Optimization guide

# Best practices

- Protect sensitive credentials. Never commit them to the repository.
- Use environment variables to store sensitive information.
- Use secrets management tools to store sensitive information.
- Use best practices to protect the privileged accounts and to limit accidental access.
- Follow Terraform best practices when creating or updating Terraform code:
  - Format all HCL files canonically using `terraform fmt`.
  - Always declare `required_version` and provider constraints in `versions.tf`.
  - Do not place `provider` configuration blocks inside reusable module code.
  - Define explicit `type`, `description`, and `validation` blocks for input variables where applicable.
  - Mark password and secret variables as `sensitive = true`.
  - Avoid hardcoding values; parameterize guest IDs, hardware versions, and resource settings.
  - Keep module outputs comprehensive (expose resource IDs, names, IP addresses, and placement details).
  - Always keep `README.md`, `docs/deployment.md`, and all `*.example.*` files synchronized with variable or architectural changes.

# Coding standards

- Do not hardcode values in the code.
- Use variables to store values.
- Use constants to store values.

# Coding conventions

# Coding style

# Coding guidelines

- When a file named *.* exists, and another one named *.example.* exists with an otherwise identical name in the same location, treat the *.example.* as an example file and replicate the structural changes to it, but not the actual values.

# Coding rules

- When using plain text passwords as parameters for userdata, make sure to also specify type 'plain' as shown here https://docs.cloud-init.io/en/latest/reference/yaml_examples/set_passwords.html

# Coding principles

# Coding patterns

# Coding anti-patterns

