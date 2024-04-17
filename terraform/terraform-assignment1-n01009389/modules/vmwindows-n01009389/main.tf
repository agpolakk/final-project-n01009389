resource "azurerm_windows_virtual_machine" "vm" {
  count                 = var.vm_count
  name                  = "${var.vm_name}-${count.index}"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]
  availability_set_id   = azurerm_availability_set.windows_availability_set.id
  tags                = local.common_tags
  
  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.wos_disk_attr["wos_disk_caching"]
    storage_account_type = var.wos_disk_attr["wos_storage_account_type"]
    disk_size_gb         = var.wos_disk_attr["wos_disk_size"]
  }

  boot_diagnostics {
    storage_account_uri = var.boot_diagnostics_storage_account_uri
  }

  provisioner "remote-exec" {
    inline = [
      "hostname"
    ]
  }

}

resource "azurerm_linux_virtual_machine_extension" "IaaSAntimalware" {
    name                 = "IaaSAntimalware"
    publisher            = "Microsoft.Azure.Security"
    type                 = "IaaSAntimalware"
    type_handler_version = "1.0"
    settings = <<SETTINGS
      {
          "operatingMode": "RealTime",
          "scheduledScanSettings": {
              "isEnabled": true,
              "day": 7,
              "scanType": "Quick",
              "startTime": "1200",
              "timeZone": "UTC"
          },
          "exclusions": {
              "extensions": [],
              "paths": []
          }
      }
SETTINGS
}

resource "azurerm_public_ip" "vm_public_ip" {
  count                = var.vm_count
  name                 = "${var.vm_name}-publicip-${count.index}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  allocation_method    = "Dynamic"
}

resource "azurerm_network_interface" "nic" {
  count                = var.vm_count
  name                 = "${var.vm_name}-nic-${count.index}"
  location             = var.location
  resource_group_name  = var.resource_group_name

  ip_configuration {
    name                          = "${var.vm_name}-ipconfig-${count.index}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_availability_set" "windows_availability_set"  {
  name                = var.windows_availability_set
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
}

