# needed to get the public IP
data "kubernetes_service_v1" "ingress_nginx_controller" {
  depends_on = [helm_release.ingress_nginx]
  metadata {
    name      = "ingress-nginx-controller"
    namespace = "ingress-nginx"
  }
}
