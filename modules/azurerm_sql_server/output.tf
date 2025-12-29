output "mssql_server_id" {
    value = {
    for key, server in azurerm_mssql_server.mssql :
    key => server.id
  }
}