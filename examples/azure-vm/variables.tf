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
