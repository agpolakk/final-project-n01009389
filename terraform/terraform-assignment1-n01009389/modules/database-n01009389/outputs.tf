output "postgresql_server_name" {
  value       = azurerm_postgresql_server.dbserver.name
  description = "The name of the PostgreSQL Server instance."
}
