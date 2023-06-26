output "rancher_url" {
  value = "https://${var.rancher_server_dns}"
}

output "custom_cluster_command" {
  value       = rancher2_cluster_v2.quickstart_workload.cluster_registration_token.0.insecure_node_command
  description = "Docker command used to add a node to the quickstart cluster"
}

output "custom_cluster_windows_command" {
  value       = rancher2_cluster_v2.quickstart_workload.cluster_registration_token.0.insecure_windows_node_command
  description = "Docker command used to add a windows node to the quickstart cluster"
}

output "install_k3s_output" {
  value       = try(jsondecode(ssh_resource.install_k3s.result), {})
  description = "Output of the k3s installation output"
}

output "rancher_node_ip" {
  value = outscale_vm.rancher_server.public_ip
}

output "workload_node_ip" {
  value = outscale_vm.quickstart_node.public_ip
}
