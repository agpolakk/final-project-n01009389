variable "location" {
  type    = string
}

variable "resource_group_name" {
  type    = string
}

variable "lb_name" {
  description = "The name of the load balancer."
}

/*
variable "vm_names" {
  type        = list(string)
  description = "List of VM names to attach data disks" 
}
*/

variable "inbound_nat_rule_name" {
  description = "The name of the inbound NAT rule."
}

variable "frontend_ip_configuration_name" {
  description = "The name of the frontend IP configuration."
}

variable "backend_pool_name" {
  description = "The name of the backend address pool."
}

variable "probe_name" {
  description = "The name of the health probe."
}

variable "network_interface_id" {
  type = map(string)
}

variable "dns_label" {
  
}

