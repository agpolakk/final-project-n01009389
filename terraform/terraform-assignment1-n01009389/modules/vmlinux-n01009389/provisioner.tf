resource "null_resource" "linux_provisioner" {
  for_each   = var.vm_instances
  depends_on = [
    azurerm_linux_virtual_machine.vm
  ]
  
  provisioner "remote-exec" {
    inline = ["/usr/bin/hostname"]

    connection {
      type        = "ssh"
      user        = var.admin_username
      private_key = file(var.priv_key)
      host        = azurerm_public_ip.vm_public_ip[each.key].fqdn
    }

  }

  provisioner "local-exec" {
    command = "ansible-playbook n01009389-playbook.yml --extra-vars 'target_hosts=${each.key}'"
  }

}
