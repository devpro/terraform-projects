# output "rancher_server_url" {
#   value = module.outscale_vm_rke2_rancher.rancher_url
# }

output "rancher_node_ip" {
  value = module.outscale_k3s.k3s_node_public_ip
}
