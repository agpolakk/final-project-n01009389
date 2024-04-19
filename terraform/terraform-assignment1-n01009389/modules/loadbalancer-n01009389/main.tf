resource "azurerm_public_ip" "lb_public_ip" {
  name                = "lb-public-ip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  domain_name_label   = var.dns_label
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

/*
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
*/

resource "azurerm_network_interface_backend_address_pool_association" "vm_association" {
  for_each                  = var.network_interface_id
  network_interface_id      = each.value
  ip_configuration_name     = "${each.key}-ipconfig"
  backend_address_pool_id   = azurerm_lb_backend_address_pool.backend_pool.id
}

resource "azurerm_lb_probe" "lb_probe" {
  loadbalancer_id = azurerm_lb.main.id
  name            = var.probe_name
  port            = 80
}

resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.main.id
  name                           = "lbrule-n01009389"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.main.frontend_ip_configuration[0].name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool.id]
  probe_id                       = azurerm_lb_probe.lb_probe.id
}
