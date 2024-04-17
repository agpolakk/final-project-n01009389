resource "azurerm_resource_group" "rgroup" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    Assignment     = "CCGC 5502 Automation Final Project"
    Name           = "Albin.Polakkattil"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

