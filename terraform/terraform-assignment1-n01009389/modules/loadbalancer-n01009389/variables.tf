variable "location" {
  type    = string
  default = "CanadaCentral"
}

variable "resource_group_name" {
  type    = string
  default = "n01663926-RG"
}

variable "lb_name" {
  description = "The name of the load balancer."
    default = "mylb"
}

variable "vm_names" {
  type        = list(string)
  description = "List of VM names to attach data disks"
  default     = ["vm1", "vm2", "vm3", "vm4"] 
}

variable "inbound_nat_rule_name" {
  description = "The name of the inbound NAT rule."
  default     = "inbound-nat-rule"
}

variable "frontend_ip_configuration_name" {
  description = "The name of the frontend IP configuration."
  default     = "frontend-ipconfig"
}

variable "backend_pool_name" {
  description = "The name of the backend address pool."
  default     = "backend-pool"
}

variable "probe_name" {
  description = "The name of the health probe."
  default     = "health-probe"
}

variable network_interface_id {
  type=list(string)
}

variable subnet_id {
  
}
