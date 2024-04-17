resource "azurerm_postgresql_server" "dbserver" {
  name                = var.dbserver_name
  location            = var.location
  resource_group_name = var.resource_group_name

  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_password

  sku_name   = var.sku_name
  storage_mb = var.storage_mb
  version    = var.edition

  ssl_enforcement_enabled = var.ssl_enforcement_enabled
  backup_retention_days   = 7
  #geo_redundant_backup    = "Disabled"
  auto_grow_enabled       = true

  public_network_access_enabled    = true
}

resource "azurerm_postgresql_database" "db" {
  name                = "db-n01009389"
  resource_group_name = azurerm_postgresql_server.dbserver.resource_group_name
  server_name         = azurerm_postgresql_server.dbserver.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
