module "resource_group" {
  source  = "../../modules/azurerm_resource_group"
  rg_name = var.rg_name
}

module "virtual_network" {
  source    = "../../modules/azurerm_networking"
  vnet_name = var.vnet_name
  depends_on = [module.resource_group]
}

module "key_vaults" {
  source                = "../../modules/azurerm_key_vaults"
  kv_name               = var.key_vaults
  pipeline_sp_object_id = var.pipeline_sp_object_id
  depends_on = [module.resource_group]
}

module "public_ip" {
  source         = "../../modules/azurerm_public_ip"
  public_ip_name = var.public_ip_name
  depends_on = [module.resource_group]
}

module "virtual_machine" {
  source = "../../modules/azurerm_compute"
  vms    = var.vms
  depends_on = [
    module.resource_group,
    module.virtual_network,
    module.public_ip,
    module.key_vaults
  ]
}

module "mssql_server" {
  source            = "../../modules/azurerm_sql_server"
  mssql_server_name = var.mssql_server_name
  key_vault_id      = module.key_vaults.kv_ids["kv_frontend"]
  depends_on = [module.resource_group, module.key_vaults]
}

module "mssql_database" {
  source          = "../../modules/azurerm_sql_database"
  mssql_db_name   = var.mssql_db_name
  mssql_server_id = module.mssql_server.mssql_server_id["sql_server_1"]
}
