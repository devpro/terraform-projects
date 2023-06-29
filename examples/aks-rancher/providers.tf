provider "azurerm" {
  features {}
}

provider "helm" {
  kubernetes {
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
