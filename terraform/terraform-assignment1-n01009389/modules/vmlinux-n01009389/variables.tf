variable "vm_instances" {
  description = "Map of VM instances with unique identifiers."
  type        = list(any)
}

variable "size" {

}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Location of the resources."
  type        = string
}

variable "admin_username" {
  description = "Admin username for the virtual machine."
  type        = string
}

variable "linux_availability_set" {
  description = "ID of the availability set."
  type        = string
}

variable "los_disk_attr" {
  description = "Storage account type for the OS disk."
  type        = map(string)
}

# variable "boot_diagnostics_storage_account_uri" {
#   description = "Storage account URI for boot diagnostics."
#   type        = string
# }

variable "subnet_id" {
  description = "ID of the subnet to attach the network interface."
  type        = string
}

variable "boot_diagnostics_storage_account_uri" {
  description = "Storage account URI for boot diagnostics."
  type        = string
}

variable "public_key" {
  
}
variable "priv_key" {
  
}

variable "linux_publisher" {
  
}
variable "linux_offer" {
  
}
variable "linux_sku" {
  
}
variable "linux_version" {
  
}
locals {
  common_tags = {
    Assignment = "CCGC 5502 Automation Assignment"
    Name = "Albin.Polakkattil"
    ExpirationDate = "2024-12-31"
    Environment = "Learning"
  }
}

# variable "nb_count" {
  
# }

