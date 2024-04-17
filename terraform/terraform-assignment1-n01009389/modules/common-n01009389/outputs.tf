output "log_analytics_name" {
  description = "Name of the provisioned Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.log_analytics.name
}

output "recovery_services_vault_name" {
  description = "Name of the provisioned Recovery Services vault."
  value       = azurerm_recovery_services_vault.recovery_services_vault.name
}

output "storage_account_name" {
  description = "Name of the provisioned Storage Account."
  value       = azurerm_storage_account.storage_account.name
}
