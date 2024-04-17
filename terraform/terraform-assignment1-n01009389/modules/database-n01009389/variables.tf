variable "dbserver_name" {
  description = "The name of the PostgreSQL Server instance."
  type        = string
}

variable "administrator_login" {
  description = "The Administrator Login for the PostgreSQL Server."
  type        = string
}

variable "administrator_password" {
  description = "The Password associated with the Administrator Login for the PostgreSQL Server."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the PostgreSQL Server instance."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "sku_name" {
  description = "Specifies the SKU Name for the PostgreSQL Server. The name of the SKU, follows the tier + family + cores pattern (e.g., B_Gen5_1, GP_Gen5_8)."
  type        = string
}

variable "storage_mb" {
  description = "Max storage allowed for the PostgreSQL Server."
  default     = 5120
  type        = number
}

variable "edition" {
  description = "Specifies the edition of PostgreSQL to use. Valid values are 9.5, 9.6, 10, 11, or 12."
  default     = "11"
  type        = string
}

variable "ssl_enforcement_enabled" {
  description = "Specifies if SSL should be enforced on connections."
  default     = true
  type        = bool
}
