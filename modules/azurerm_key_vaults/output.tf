output "kv_ids" {
  description = "Map of Key Vault ids keyed by instance key"
  value       = { for k, v in azurerm_key_vault.kv : k => v.id }
}

output "kv_names" {
  description = "Map of Key Vault names keyed by instance key"
  value       = { for k, v in azurerm_key_vault.kv : k => v.name }
}
