resource "azurerm_public_ip" "lb_public_ip" {
  name                = "lb-public-ip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_lb" "main" {
  name                = var.lb_name
  resource_group_name = var.resource_group_name
  location            = var.location

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }

  tags = {
    Assignment     = "CCGC 5502 Automation Final Project"
    Name           = "Albin.Polakkattil"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name                = "backend-pool"
  loadbalancer_id     = azurerm_lb.main.id
}

resource "azurerm_network_interface" "linux_nic" {
  for_each            = toset(var.vm_names)
  name                = "nic-${each.value}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig-${each.value}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_backend_address_pool_association" "vm_association" {
  for_each                  = toset(var.vm_names)
  network_interface_id      = azurerm_network_interface.linux_nic[each.key].id
  ip_configuration_name     = azurerm_network_interface.linux_nic[each.key].ip_configuration[0].name
  backend_address_pool_id   = azurerm_lb_backend_address_pool.backend_pool.id
}