variable "azure_location" {
  description = "Location of the Azure datacenter"
  type        = string
}

variable "resource_suffix" {
  description = "Resource name suffix"
  type        = string
}

variable "node_count" {
  description = "AKS node count (pool of worker nodes)"
  type        = string
}

variable "azure_vm_size" {
  description = "Azure VM size"
  type        = string
}

variable "resource_tags" {
  description = "List of tags (key => value) to create on resources"
  type        = map(string)
  default     = {}
}

# variable "tags_to_ignore" {
#   description = "Tags to ignore"
#   type        = list(string)
#   default     = ["Cost Center", "Department", "Finance Business Partner", "General Ledger Code", "Group", "Owner", "Stakeholder"]
# }
