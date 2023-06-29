resource "ssh_resource" "install_k3s" {
  host        = data.outscale_public_ip.k3s.public_ip
  user        = var.node_username
  private_key = var.ssh_private_key_pem

  file {
    content     = "curl https://get.k3s.io | INSTALL_K3S_EXEC=\"server --node-external-ip ${data.outscale_public_ip.k3s.public_ip} --node-ip ${outscale_vm.k3s_node.private_ip}\" INSTALL_K3S_VERSION=${var.kubernetes_version} sh -"
    destination = "/home/${var.node_username}/install_k3s.sh"
    permissions = "0700"
  }

  commands = [
    "/home/${var.node_username}/install_k3s.sh"
  ]
}

resource "ssh_resource" "retrieve_config" {
  host        = data.outscale_public_ip.k3s.public_ip
  user        = var.node_username
  private_key = var.ssh_private_key_pem

  commands = [
    "sudo sed \"s/127.0.0.1/${data.outscale_public_ip.k3s.public_ip}/g\" /etc/rancher/k3s/k3s.yaml"
  ]

  depends_on = [ssh_resource.install_k3s]
}
