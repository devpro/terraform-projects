module "aks-rancher" {
  source = "../../modules/aks-rancher"

  azure_location   = var.azure_location
  resource_suffix  = var.azure_resource_suffix
  node_count       = var.aks_node_count
  azure_vm_size    = var.azure_vm_size
}

variable "azure_location" {
  description = "Location of the Azure datacenter"
  type        = string
  default     = "westeurope"
}

variable "azure_resource_suffix" {
  description = "Resource name suffix"
  type        = string
  default     = "sample-12345"
}

variable "aks_node_count" {
  description = "Number of AKS workder nodes"
  type        = number
  default     = 1
}

variable "azure_vm_size" {
  description = "Size of Azure Virtual Machines"
  type        = string
  default     = "Standard_D2_v2"
}

output "aks_client_certificate" {
  value     = module.aks-rancher.client_certificate
  sensitive = true
}

output "aks_kube_config" {
  value     = module.aks-rancher.kube_config
  sensitive = true
}
