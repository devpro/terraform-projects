terraform {
  required_version = ">= 1.1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.13"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.3"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 3.5"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "helm" {
  kubernetes = {
    host                   = data.azurerm_kubernetes_cluster.management.kube_config[0].host
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.management.kube_config[0].client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.management.kube_config[0].client_key)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.management.kube_config[0].cluster_ca_certificate)
  }
}

provider "kubernetes" {
  host                   = data.azurerm_kubernetes_cluster.management.kube_config[0].host
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.management.kube_config[0].client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.management.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.management.kube_config[0].cluster_ca_certificate)
}
