
output "rgroup_info" {
  value = {
    resource_group_name = module.rgroup.rgroup_name.name
    location            = module.rgroup.rgroup_name.location
  }
}

output "network_info" {
  value = {
    vnet_name   = module.network.vnet_name
    subnet_name = module.network.subnet_name
  }
}

output "common_info" {
  value = {
    log_analytics_name            = module.common.log_analytics_name
    recovery_services_vault_name  = module.common.recovery_services_vault_name
    storage_account_name          = module.common.storage_account_name
  }
}

output "linux_info" {
  value = {
    vm_hostname         = module.vmlinux.vm_hostname
    virtual_machine_ids = module.vmlinux.virtual_machine_ids
    vm_fqdn             = module.vmlinux.vm_fqdn
    private_ip_address  = module.vmlinux.private_ip_address
    public_ip_address   = module.vmlinux.public_ip_address
  }
}

// Similarly, define outputs for other modules
