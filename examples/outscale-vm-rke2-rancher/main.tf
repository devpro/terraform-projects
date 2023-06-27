locals {
  node_username = "outscale"
}

resource "tls_private_key" "global_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

module "outscale_k3s" {
  source = "../../modules/outscale-k3s"

  instance_type       = var.instance_type
  kubernetes_version  = var.rancher_kubernetes_version
  node_username       = local.node_username
  omi                 = var.omi
  prefix              = var.prefix
  ssh_private_key_pem = tls_private_key.global_key.private_key_pem
  ssh_public_key      = tls_private_key.global_key.public_key_openssh
}

module "helm_rancher" {
  source = "../../modules/helm-rancher"

  admin_password          = var.rancher_server_admin_password
  cert_manager_version    = var.cert_manager_version
  rancher_helm_repository = var.rancher_helm_repository
  rancher_server_dns      = join(".", ["https://rancher", module.outscale_k3s.k3s_node_public_ip, "sslip.io"])
  rancher_version         = var.rancher_version

  depends_on = [module.outscale_k3s]

  providers = {
    rancher2 = rancher2.bootstrap
  }
}

# module "outscale_vm_rke2_rancher" {
#   source = "../../modules/outscale-vm-rke2-rancher"

#   instance_type               = var.instance_type
#   omi                         = var.omi
#   prefix                      = var.prefix
#   workload_cluster_name       = "quickstart-outscale-custom"
#   workload_kubernetes_version = var.workload_kubernetes_version
#   ssh_public_key = tls_private_key.global_key.public_key_openssh
# }
