resource "ssh_resource" "install_k3s" {
  host        = data.outscale_public_ip.rancher_server.public_ip
  user        = var.node_username
  private_key = var.ssh_private_key_pem
  file {
    content     = "curl https://get.k3s.io | INSTALL_K3S_EXEC=\"server --node-external-ip ${data.outscale_public_ip.rancher_server.public_ip} --node-ip ${outscale_vm.rancher_server.private_ip}\" INSTALL_K3S_VERSION=${var.kubernetes_version} sh -"
    destination = "/home/${var.node_username}/install_k3s.sh"
    permissions = "0700"
  }
  commands = [
    "/home/${var.node_username}/install_k3s.sh"
  ]
}

resource "ssh_resource" "retrieve_config" {
  depends_on = [
    ssh_resource.install_k3s
  ]
  host = data.outscale_public_ip.rancher_server.public_ip
  commands = [
    "sudo sed \"s/127.0.0.1/${data.outscale_public_ip.rancher_server.public_ip}/g\" /etc/rancher/k3s/k3s.yaml"
  ]
  user        = var.node_username
  private_key = var.ssh_private_key_pem
}
