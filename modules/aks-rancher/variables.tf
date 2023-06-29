variable "azure_location" {
  description = "Location of the Azure datacenter"
  type        = string
}

variable "azure_vm_size" {
  description = "Azure VM size"
  type        = string
}

variable "cert_manager_version" {
  description = "Version of cert-manager to install on the cluster (mandatory for Rancher)"
  type        = string
  default     = "1.11.0"
}

variable "kube_api_access_authorized_ips" {
  description = "Authorized IP ranges to access Kubernetes API server"
  type        = list(string)
}

variable "node_count" {
  description = "AKS node count (pool of worker nodes)"
  type        = string
}

variable "rancher_version" {
  description = "Version of rancher to install on the cluster"
  type        = string
  default     = "2.7.4"
}

variable "resource_suffix" {
  description = "Resource name suffix"
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
