# TODO: understand why it is empty
output "install_k3s_output" {
  value       = try(jsondecode(ssh_resource.install_k3s.result), {})
  description = "Output of the k3s installation output"
}

output "k3s_node_public_ip" {
  value = outscale_vm.k3s_node.public_ip
}

output "kubeconfig_local_file" {
  value = local_file.kube_config_server_yaml.filename
}

output "security_group_id" {
  value = outscale_security_group.allowall.security_group_id
}
