locals {
  creator       = "Rancher quickstart"
  node_username = "outscale"
}

resource "tls_private_key" "global_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

module "outscale_k3s" {
  source = "../../modules/outscale-k3s"

  creator             = local.creator
  kubernetes_version  = var.rancher_kubernetes_version
  node_username       = local.node_username
  resource_prefix     = var.prefix
  ssh_private_key_pem = tls_private_key.global_key.private_key_pem
  ssh_public_key      = tls_private_key.global_key.public_key_openssh
  vm_image            = var.omi
  vm_type             = var.instance_type
}

module "helm_rancher" {
  source = "../../modules/helm-rancher"

  admin_password          = var.rancher_server_admin_password
  cert_manager_version    = var.cert_manager_version
  rancher_helm_repository = var.rancher_helm_repository
  rancher_server_dns      = join(".", ["rancher", module.outscale_k3s.k3s_node_public_ip, "sslip.io"])
  rancher_version         = var.rancher_version

  depends_on = [module.outscale_k3s]

  providers = {
    rancher2 = rancher2.bootstrap
  }
}

module "outscale_rancher_rke2" {
  source = "../../modules/outscale-rancher-rke2"

  instance_type               = var.instance_type
  node_username               = local.node_username
  omi                         = var.omi
  prefix                      = var.prefix
  security_group_id           = module.outscale_k3s.security_group_id
  ssh_private_key_pem         = tls_private_key.global_key.private_key_pem
  ssh_public_key              = tls_private_key.global_key.public_key_openssh
  workload_cluster_name       = "quickstart-outscale-custom"
  workload_kubernetes_version = var.workload_kubernetes_version

  depends_on = [module.helm_rancher]

  providers = {
    rancher2 = rancher2.admin
  }
}
