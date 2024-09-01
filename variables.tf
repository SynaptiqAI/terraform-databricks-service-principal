
variable "databricks_account_id" {
  type        = string
  description = "(Required) Databricks Account ID"
}

variable "databricks_workspace_id" {
  type        = string
  description = "(Required) The Databricks Workspace ID for the existing workspace that will have resources deployed into it."
}

variable "databricks_workspace_users_group_id" {
  type        = string
  description = "(Required) The Databricks workspace users group ID that the Databricks Job resources are added to."
}

variable "databricks_service_principal_workspace_admin_acl_principal_id" {
  type        = string
  description = "(Required) The ACL principal id of the Databricks workspace admin service principal."
}

variable "name" {
  type        = string
  description = "(Required) The name of the Databricks Service Principal."
}

variable "tags" {
  type        = map(string)
  description = "(Optional) List of tags to be propagated across all resources."
  default     = {}
}
