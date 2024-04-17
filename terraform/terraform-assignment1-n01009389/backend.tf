terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01009389RG"
    storage_account_name = "tfstaten01009389sa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate.final"
  }
}
