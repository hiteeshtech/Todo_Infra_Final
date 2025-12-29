resource "azurerm_mssql_database" "mssql_db" {
  for_each     = var.mssql_db_name
  name         = each.value.mssql_db_name
  server_id    = var.mssql_server_id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type

  tags = {
    environment = "dev"
  }

  # Temporarily disable prevent_destroy to allow replacement during this deployment.
  # Re-enable after migration / verification.
  lifecycle {
    prevent_destroy = false
  }
}
