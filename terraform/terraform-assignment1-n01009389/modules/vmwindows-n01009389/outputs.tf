output "vm_windows_hostname" {
  value = values(azurerm_windows_virtual_machine.vm)[*].name
}
output "windows_private_ip_address" {
  value = values(azurerm_network_interface.nic)[*].private_ip_address
}
output "windows_public_ip_address" {
  value = values(azurerm_public_ip.vm_public_ip)[*].public_ip_address
}
output "windows_availability_set" {
  value = values(azurerm_availability_set.network3)[*].name
}
output "fqdn" {
  value = values(azurerm_public_ip.public_ip)[*].fqdn
}
