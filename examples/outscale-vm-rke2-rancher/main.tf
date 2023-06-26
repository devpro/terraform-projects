locals {
  node_username = "outscale"
}

resource "tls_private_key" "global_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

module "outscale_vm_k3s" {
  source = "../../modules/outscale-vm-k3s"

  instance_type       = var.instance_type
  kubernetes_version  = var.rancher_kubernetes_version
  node_username       = local.node_username
  omi                 = var.omi
  prefix              = var.prefix
  ssh_private_key_pem = tls_private_key.global_key.private_key_pem
  ssh_public_key      = tls_private_key.global_key.public_key_openssh
}

# module "outscale_vm_rke2_rancher" {
#   source = "../../modules/outscale-vm-rke2-rancher"

#   admin_password              = var.rancher_server_admin_password
#   cert_manager_version        = var.cert_manager_version
#   instance_type               = var.instance_type
#   omi                         = var.omi
#   prefix                      = var.prefix
#   rancher_helm_repository     = var.rancher_helm_repository
#   rancher_version             = var.rancher_version
#   workload_cluster_name       = "quickstart-outscale-custom"
#   workload_kubernetes_version = var.workload_kubernetes_version

#   ssh_public_key = tls_private_key.global_key.public_key_openssh

#   rancher_server_dns          = join(".", ["rancher", outscale_public_ip.rancher_server.public_ip, "sslip.io"])
# }
