variable "location" {
  type    = string
  default = "CanadaCentral"
}

variable "resource_group_name" {
  type    = string
  default = "n01663926-RG"
}

variable "vm-linux-0_names" {
  type        = list(string)
  description = "List of vm-linux-0 names to attach data disks"
  default     = ["vm-linux-01", "vm-linux-02", "vm-linux-03", "vm-linux-04"] 
}

variable "disk_size_gb" {
  type        = number
  description = "Size of each data disk in GB"
  default     = 10
}

variable "vm_ids" {
  description = "List of virtual machine IDs"
  type        = list(string)
  default     = [
    "/subscriptions/8339a174-3737-42f0-aaa4-d1c412a37002/resourceGroups/n01009389-RG/providers/Microsoft.Compute/virtualMachines/n01009389-u-vm1",
    "/subscriptions/8339a174-3737-42f0-aaa4-d1c412a37002/resourceGroups/n01009389-RG/providers/Microsoft.Compute/virtualMachines/n01009389-u-vm2",
    "/subscriptions/8339a174-3737-42f0-aaa4-d1c412a37002/resourceGroups/n01009389-RG/providers/Microsoft.Compute/virtualMachines/n01009389-u-vm3"
  ]
}

variable "vm_names" {
  type        = list(string)
   default     = ["n01009389-u-vm1", "n01009389-u-vm2", "n01009389-u-vm3"]
}
