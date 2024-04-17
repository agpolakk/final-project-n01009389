resource "null_resource" "linux_provisioner" {
  count   = length(var.vm_instances)
  # name = var.vm_instances[count.index]
  depends_on = [
    azurerm_linux_virtual_machine.vm
  ]

  provisioner "remote-exec" {
    inline = [
      "/usr/bin/hostname"
    ]

    connection {
      type        = "ssh"
      user        = var.admin_username
      private_key = file(var.priv_key)
      # host        = azurerm_linux_virtual_machine.vm[count.index].network_interface_ids[0]
      host = element(azurerm_public_ip.vm_public_ip[*].fqdn, count.index + 1)
      # host = azurerm_public_ip.public_ip.fqdn
    }

  }
}
