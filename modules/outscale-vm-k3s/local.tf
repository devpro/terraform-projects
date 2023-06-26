resource "local_file" "kube_config_server_yaml" {
  filename = format("%s/%s", path.root, "kube_config_server.yaml")
  content  = ssh_resource.retrieve_config.result
}

resource "local_sensitive_file" "ssh_private_key_pem" {
  filename        = "${path.module}/id_rsa"
  content         = var.ssh_private_key_pem
  file_permission = "0600"
}

resource "local_file" "ssh_public_key_openssh" {
  filename = "${path.module}/id_rsa.pub"
  content  = var.ssh_public_key
}
