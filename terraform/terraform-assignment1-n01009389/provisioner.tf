resource "null_resource" "AnsibleExec" {
  provisioner "local-exec" {
    command = "ansible-playbook ../ansible/n01009389-playbook.yml"
    }
    depends_on = [
      module.rgroup,
      #module.datadisk,
      module.vmlinux,
      #module.vmwindows
    ]
}
