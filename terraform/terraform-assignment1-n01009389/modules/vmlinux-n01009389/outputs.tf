# output "vm_info" {
#   description = "Information about the provisioned virtual machines."
#   value       = azurerm_linux_virtual_machine.vm_info
# }

output "vm_hostname" {
  value = [azurerm_linux_virtual_machine.vm[*].computer_name]
}
output "vm_fqdn" {
  description = "Map of virtual machine FQDNs"
  value       = [azurerm_public_ip.vm_public_ip[*].fqdn]
}
output "private_ip_address" {
  value = [azurerm_network_interface.nic[*].private_ip_address]
}
output "public_ip_address" {
  value = [azurerm_public_ip.vm_public_ip[*].ip_address]
}

output "linux_availability_set_name" {
  value = azurerm_availability_set.linux_availability_set.name
}

output "virtual_machine_ids" {
  description = "Map of virtual machine IDs"
  value       = [azurerm_linux_virtual_machine.vm[*].id]
}

output "public_ip_ids" {
  description = "Map of public IP IDs"
  value       = [azurerm_public_ip.vm_public_ip[*].id]
}

output "network_interface_ids" {
  description = "Map of network interface IDs"
  value       = [azurerm_network_interface.nic[*].id]
}

output "availability_set_id" {
  description = "ID of the availability set"
  value       = azurerm_availability_set.linux_availability_set.id
}
