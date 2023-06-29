output "client_certificate" {
  value = azurerm_kubernetes_cluster.management.kube_config[0].client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.management.kube_config_raw
}

output "load_balancer_ip" {
  value = data.kubernetes_service.ingress_nginx_controller.status[0].load_balancer[0].ingress[0].ip
}

output "rancher_host" {
  value = join(".", ["rancher", data.kubernetes_service.ingress_nginx_controller.status[0].load_balancer[0].ingress[0].ip, "sslip.io"])
}
