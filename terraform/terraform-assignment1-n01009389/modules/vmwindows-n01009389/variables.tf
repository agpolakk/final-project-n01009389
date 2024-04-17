variable "vm_count" {
  description = "Number of VM instances to create."
  type        = number
}

variable "vm_name" {
  description = "Base name for the VM instances."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Location of the resources."
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine."
  type        = string
}

variable "admin_username" {
  description = "Admin username for the virtual machine."
  type        = string
}

variable "admin_password" {
  description = "Admin password for the virtual machine."
  type        = string
}

variable "wos_disk_attr"  {
    type = map(string)
}
variable "windows_publisher"  {
    
}
variable "windows_offer"  {
    
}
variable "windows_sku"  {
    
}
variable "windows_version"  {
    
}
variable "windows_availability_set"  {
    
}

variable "boot_diagnostics_storage_account_uri" {
  description = "Storage account URI for boot diagnostics."
  type        = string
}

variable "public_key" {
  
}
variable "priv_key" {
  
}

variable "subnet_id" {
  description = "ID of the subnet to attach the network interface."
  type        = string
}

# variable "domain_name" {
#   description = "Domain name for the VMs."
#   type        = string
# }

locals {
  common_tags = {
    Assignment = "CCGC 5502 Automation Assignment"
    Name = "Albin.Polakkattil"
    ExpirationDate = "2024-12-31"
    Environment = "Learning"
  }
}
