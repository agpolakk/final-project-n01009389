resource "azurerm_linux_virtual_machine" "vm" {
  # for_each                = var.vm_instances
  count = length(var.vm_instances)
  # name                    = each.key
  name                    = var.vm_instances[count.index]
  # computer_name       = each.key
  computer_name           = var.vm_instances[count.index]
  resource_group_name     = var.resource_group_name
  location                = var.location
  # size                    = each.value
  size                    = var.size
  # count                   = var.nb_count
  admin_username          = var.admin_username
  disable_password_authentication = true
  # network_interface_ids   = [azurerm_network_interface.nic[each.key].id]
  network_interface_ids   = [azurerm_network_interface.nic[count.index].id]
  availability_set_id     = azurerm_availability_set.linux_availability_set.id
  tags                = local.common_tags

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key)
  }

  os_disk {
    name                 = "${var.vm_instances[count.index]}-os-disk"
    caching              = var.los_disk_attr["los_disk_caching"]
    storage_account_type = var.los_disk_attr["los_storage_account_type"]
    disk_size_gb         = var.los_disk_attr["los_disk_size"]
  }

  source_image_reference {
    publisher = var.linux_publisher
    offer     = var.linux_offer
    sku       = var.linux_sku
    version   = var.linux_version
  }
  
  boot_diagnostics {
    storage_account_uri = var.boot_diagnostics_storage_account_uri
  }

}

resource "azurerm_virtual_machine_extension" "networkWatcher" {
  # for_each           = azurerm_linux_virtual_machine.vm
  count = length(var.vm_instances)
  virtual_machine_id = azurerm_linux_virtual_machine.vm[count.index].id
  name                 = "networkWatcher"
  publisher            = "Microsoft.Azure.NetworkWatcher"
  type                 = "NetworkWatcherAgentLinux"
  type_handler_version = "1.0.0"
  }

  resource "azurerm_virtual_machine_extension" "azureMonitor" {
    # for_each           = azurerm_linux_virtual_machine.vm
    # virtual_machine_id = each.value.id
    count = length(var.vm_instances)
  virtual_machine_id = azurerm_linux_virtual_machine.vm[count.index].id
    name                 = "azureMonitor"
    publisher            = "Microsoft.Azure.Monitor"
    type                 = "AzureMonitorLinuxAgent"
    type_handler_version = "1.0.0"
  }

resource "azurerm_public_ip" "vm_public_ip" {
  count = length(var.vm_instances)
  # for_each                = var.vm_instances
  name                    = "${var.vm_instances[count.index]}-publicip"
  location                = var.location
  resource_group_name     = var.resource_group_name
  allocation_method       = "Dynamic"
}

resource "azurerm_network_interface" "nic" {
  # for_each                = var.vm_instances
  count = length(var.vm_instances)
  name                    = "${var.vm_instances[count.index]}-nic"
  location                = var.location
  resource_group_name     = var.resource_group_name
  
  ip_configuration {
    
    name                          = "${var.vm_instances[count.index]}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.vm_public_ip[count.index].id}"
  }

  tags = {
    Assignment     = "CCGC 5502 Automation Final Project"
    Name           = "Albin.Polakkattil"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

resource "azurerm_availability_set" "linux_availability_set" {
  name                         = var.linux_availability_set
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = 3
  platform_update_domain_count = 3
}

