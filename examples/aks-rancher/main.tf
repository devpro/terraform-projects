module "aks-rancher" {
  source = "../../modules/aks-rancher"

  azure_location        = var.azure_location
  azure_resource_suffix = var.azure_resource_suffix
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

output "client_certificate" {
  value     = module.aks-rancher.client_certificate
  sensitive = true
}

output "kube_config" {
  value     = module.aks-rancher.kube_config
  sensitive = true
}
