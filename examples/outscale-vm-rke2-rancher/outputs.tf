output "rancher_node_ip" {
  value = module.outscale_k3s.k3s_node_public_ip
}

output "rancher_url" {
  value = module.helm_rancher.rancher_url
}
