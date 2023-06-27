output "rancher_url" {
  value = "https://${var.rancher_server_dns}"
}

output "workload_node_ip" {
  value = outscale_vm.quickstart_node.public_ip
}
