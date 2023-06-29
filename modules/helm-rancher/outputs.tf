output "rancher_bootstrap_admin_token" {
  value = rancher2_bootstrap.admin.token
}

output "rancher_url" {
  value = "https://${var.rancher_server_dns}"
}
