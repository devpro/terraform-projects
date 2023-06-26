data "outscale_public_ip" "rancher_server" {
  filter {
    name   = "public_ips"
    values = [outscale_public_ip.rancher_server.public_ip]
  }
  public_ip  = outscale_public_ip.rancher_server.public_ip
  depends_on = [outscale_public_ip_link.rancher_server, outscale_security_group_rule.security_group_rule01]
}
