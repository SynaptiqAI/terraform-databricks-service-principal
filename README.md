# terraform-databricks-service-principal

A Terraform module to create and manage Databricks Service Principals intended to run Databricks Jobs.

## Features
- [X] Service Principal with Admin Permissions in a Workspace

## Planned Functionality
- [] More scoped and configurable permissions

## Usage

```hcl
provider "databricks" {
  alias         = "workspace"
  host          = var.databricks_workspace_host_url
  client_id     = var.databricks_workspace_service_principal_id
  client_secret = var.databricks_client_secret
}

module "databricks_service_principal_example" {
  source = "github.com/SynaptiqAI/terraform-databricks-service-principal?ref=v0.1.0"

  providers = {
    databricks     = databricks.workspace
    databricks.mws = databricks.mws
  }

  databricks_account_id                                         = var.databricks_account_id
  databricks_workspace_id                                       = var.databricks_workspace_id
  databricks_workspace_users_group_id                           = var.databricks_workspace_users_group_id
  databricks_service_principal_workspace_admin_acl_principal_id = data.databricks_service_principal.workspace_admin_service_principal.acl_principal_id
  name                                                          = "example"
}
```

## License
MIT Licensed. See (LICENSE](https://github.com/SynaptiqAI/terraform-databricks-service-principal/blob/main/LICENSE) for full details.
