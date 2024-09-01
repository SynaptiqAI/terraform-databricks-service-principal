
resource "databricks_service_principal" "this" {
  provider                 = databricks
  display_name             = var.name
  disable_as_user_deletion = false
}

resource "databricks_group_member" "this" {
  provider   = databricks.mws
  group_id   = var.databricks_workspace_users_group_id
  member_id  = databricks_service_principal.this.id
  depends_on = [databricks_service_principal.this]
}

resource "databricks_mws_permission_assignment" "this" {
  provider     = databricks.mws
  workspace_id = var.databricks_workspace_id
  principal_id = databricks_service_principal.this.id
  permissions  = ["ADMIN"]
  depends_on   = [databricks_group_member.this]
}

resource "databricks_access_control_rule_set" "this" {
  provider = databricks.mws
  name     = "accounts/${var.databricks_account_id}/servicePrincipals/${databricks_service_principal.this.application_id}/ruleSets/default"

  grant_rules {
    principals = [var.databricks_service_principal_workspace_admin_acl_principal_id]
    role       = "roles/servicePrincipal.user"
  }

  grant_rules {
    principals = [var.databricks_service_principal_workspace_admin_acl_principal_id]
    role       = "roles/servicePrincipal.manager"
  }

  depends_on = [databricks_mws_permission_assignment.this]
}
