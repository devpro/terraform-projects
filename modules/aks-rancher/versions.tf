terraform {
  required_version = ">= 1.1.0"

  required_providers {
    # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.61.0"
    }
  }
}
