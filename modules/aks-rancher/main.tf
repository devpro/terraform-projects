resource "azurerm_resource_group" "management" {
  name     = "rg-${var.resource_suffix}"
  location = var.azure_location

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_kubernetes_cluster" "management" {
  name                = "aks-${var.resource_suffix}"
  location            = azurerm_resource_group.management.location
  resource_group_name = azurerm_resource_group.management.name
  dns_prefix          = "dns-${var.resource_suffix}"
  tags                = var.resource_tags

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.azure_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    # limitation: has to be a static list expression (ref. https://github.com/hashicorp/terraform/issues/22544), cannot be read from variable
    ignore_changes = [
      tags
      # tags.field1
      # tags["Field 1"]
    ]
  }
}

# https://github.com/kubernetes/ingress-nginx/tree/main/charts/ingress-nginx
resource "helm_release" "ingress_nginx" {
  name             = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  create_namespace = true
  wait             = true

  # fix: AKS with Kubernetes 1.24+ issue with Ingresses not accessible (ref. https://stackoverflow.com/questions/75247903/aks-ingress-nginx-ingress-controller-failing-to-route-by-host)
  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-health-probe-request-path"
    value = "/healthz"
  }

  depends_on = [
    azurerm_kubernetes_cluster.management
  ]
}

# ref. https://github.com/cert-manager/cert-manager/tree/master/deploy/charts/cert-manager
resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  version          = var.cert_manager_version
  namespace        = "cert-manager"
  create_namespace = true
  wait             = true

  set {
    name  = "installCRDs"
    value = "true"
  }
}

# ref. https://github.com/rancher/rancher/tree/release/v2.7/chart
resource "helm_release" "rancher" {
  name             = "rancher"
  repository       = "https://releases.rancher.com/server-charts/stable"
  chart            = "rancher"
  version          = var.rancher_version
  namespace        = "cattle-system"
  create_namespace = true

  set {
    name  = "hostname"
    value = join(".", ["rancher", data.kubernetes_service.ingress_nginx_controller.status[0].load_balancer[0].ingress[0].ip, "sslip.io"])
  }

  set {
    name  = "ingress.ingressClassName"
    value = "nginx"
  }

  set {
    name  = "replicas"
    value = "1"
  }

  set {
    name  = "global.cattle.psp.enabled"
    value = "false"
  }

  set {
    name  = "bootstrapPassword"
    value = "admin"
  }

  depends_on = [
    helm_release.cert_manager,
    helm_release.ingress_nginx
  ]
}
