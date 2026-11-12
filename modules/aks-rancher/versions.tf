terraform {
  required_version = ">= 1.1.0"

  required_providers {
    # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.13.0"
    }
    # https://registry.terraform.io/providers/hashicorp/helm/latest/docs
    helm = {
      source  = "hashicorp/helm"
      version = "3.3.0"
    }
    # https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.5.0"
    }
  }
}
