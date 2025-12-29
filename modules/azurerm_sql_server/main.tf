resource "azurerm_mssql_server" "mssql" {
  for_each                     = var.mssql_server_name
  name                         = each.value.mssql_server_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = each.value.version
  minimum_tls_version          = each.value.minimum_tls_version
  administrator_login          = data.azurerm_key_vault_secret.mssql_username[each.key].value
  administrator_login_password = data.azurerm_key_vault_secret.mssql_password[each.key].value

  tags = {
    environment = "dev"

  }
}

