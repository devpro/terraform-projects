output "install_k3s_output" {
  value       = try(jsondecode(ssh_resource.install_k3s.result), {})
  description = "Output of the k3s installation output"
}

output "rancher_node_ip" {
  value = outscale_vm.rancher_server.public_ip
}
