# Use Key Vault id passed in via variable to avoid reading a resource created in same plan

data "azurerm_key_vault_secret" "mssql_username" {
  for_each     = var.mssql_server_name
  name         = "mssqlserver-username"
  key_vault_id = var.key_vault_id
}

data "azurerm_key_vault_secret" "mssql_password" {
  for_each     = var.mssql_server_name
  name         = "mssqlserver-password"
  key_vault_id = var.key_vault_id
}
