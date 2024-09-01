terraform {
  required_providers {
    databricks = {
      source                = "databricks/databricks"
      version               = ">=1.38.0"
      configuration_aliases = [databricks.mws]
    }
  }
}
