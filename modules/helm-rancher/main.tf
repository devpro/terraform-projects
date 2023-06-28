resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  chart            = "https://charts.jetstack.io/charts/cert-manager-v${var.cert_manager_version}.tgz"
  namespace        = "cert-manager"
  create_namespace = true
  wait             = true

  set {
    name  = "installCRDs"
    value = "true"
  }
}

resource "helm_release" "rancher_server" {
  name             = "rancher"
  chart            = "${var.rancher_helm_repository}/rancher-${var.rancher_version}.tgz"
  namespace        = "cattle-system"
  create_namespace = true
  wait             = true

  # sets values (ref. https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/installation-references/helm-chart-options, https://github.com/rancher/rancher/blob/release/v2.7/chart/values.yaml)
  set {
    name  = "hostname"
    value = var.rancher_server_dns
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

  depends_on = [helm_release.cert_manager]
}

# configures first login (ref. https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/bootstrap)
resource "rancher2_bootstrap" "admin" {
  initial_password = "admin"
  password  = var.admin_password
  telemetry = true

  depends_on = [helm_release.rancher_server]
}
