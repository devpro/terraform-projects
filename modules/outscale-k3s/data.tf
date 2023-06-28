data "outscale_public_ip" "k3s" {
  filter {
    name   = "public_ips"
    values = [outscale_public_ip.default.public_ip]
  }
  public_ip  = outscale_public_ip.default.public_ip
  depends_on = [outscale_public_ip_link.cloud_init, outscale_security_group_rule.inboundall]
}
