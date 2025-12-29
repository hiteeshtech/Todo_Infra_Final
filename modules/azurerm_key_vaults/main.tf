data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  for_each            = var.kv_name
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  soft_delete_retention_days = 7
  purge_protection_enabled  = false

  # 👤 HUMAN (Terraform runner / local)
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get", "List", "Set", "Delete", "Backup", "Restore", "Recover", "Purge"
    ]
  }

  # 🤖 PIPELINE SERVICE PRINCIPAL (MOST IMPORTANT)
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.pipeline_sp_object_id

    secret_permissions = [
      "Get",
      "List"
    ]
  }
}
