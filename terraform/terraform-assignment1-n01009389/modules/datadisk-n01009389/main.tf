resource "azurerm_managed_disk" "data_disk" {
  count                = length(var.vm_names) * 4  # Assuming you want 4 disks per VM
  name                 = "datadisk-${var.vm_names[floor(count.index / 4)]}-${count.index % 4 + 1}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb

  tags = {
    Assignment      = "CCGC 5502 Automation Final Project"
    Name            = "Albin.Polakkattil"
    ExpirationDate  = "2024-12-31"
    Environment     = "Learning"
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attachment" {
  count                 = length(var.vm_names) * 4
  virtual_machine_id = element(var.vm_ids, floor(count.index / 4))
  managed_disk_id       = azurerm_managed_disk.data_disk[count.index].id
  lun                   = count.index % 4
  caching               = "ReadWrite"  # Specify the caching attribute
}
