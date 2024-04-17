resource "null_resource" "linux_provisioner" {
  depends_on = [
    azurerm_linux_virtual_machine.network
  ]

  provisioner "remote-exec" {
    inline = [
      "/usr/bin/hostname"
    ]

    connection {
      type        = "ssh"
      user        = var.admin_username
      private_key = file(var.priv_key)
      host        = azurerm_windows_virtual_machine.vm[count.index].network_interface_ids[0]
      #host = element(azurerm_public_ip.public_ip[*].fqdn, count.index + 1)
      #host = azurerm_public_ip.public_ip.fqdn
    }

  }
}
