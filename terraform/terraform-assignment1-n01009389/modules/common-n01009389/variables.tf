variable "log_analytics_name" {
  description = "Name of the Log Analytics workspace."
  type        = string
}

variable "location" {
  description = "Location of the resources."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "log_analytics_sku" {
  description = "SKU for the Log Analytics workspace."
  type        = string
  default     = "PerGB2018"
}

variable "recovery_services_vault_name" {
  description = "Name of the Recovery Services vault."
  type        = string
}

variable "storage_account_name" {
  description = "Name of the Storage Account."
  type        = string
}

variable "storage_account_tier" {
  description = "Tier of the Storage Account."
  type        = string
  default     = "Standard"
}
