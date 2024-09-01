
output "service_principal_id" {
  description = "Canonical unique identifier for the permissions in form of /<object type>/<object id>."
  value       = try(databricks_service_principal.this.id, "")
}

output "service_principal_application_id" {
  description = "This is the Azure Application ID of the given Azure service principal and will be their form of access and identity. For Databricks-managed service principals this value is auto-generated."
  value       = try(databricks_service_principal.this.application_id, "")
}

output "databricks_access_control_rule_set_id" {
  description = "ID of the access control rule set - the same as name."
  value       = try(databricks_access_control_rule_set.this.id, "")
}
