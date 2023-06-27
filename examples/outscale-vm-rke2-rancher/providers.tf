terraform {
  required_providers {
    # https://github.com/hashicorp/terraform-provider-tls
    tls = {
      source  = "hashicorp/tls"
      version = "3.4.0"
    }
    # https://github.com/outscale/terraform-provider-outscale
    outscale = {
      source  = "outscale/outscale"
      version = "0.9.1"
    }
    # https://github.com/rancher/terraform-provider-rancher2
    rancher2 = {
      source  = "rancher/rancher2"
      version = "3.0.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = module.outscale_k3s.kubeconfig_local_file
  }
}

provider "outscale" {
}

provider "rancher2" {
  alias     = "bootstrap"
  api_url   = join(".", ["https://rancher", module.outscale_k3s.k3s_node_public_ip, "sslip.io"])
  insecure  = true
  bootstrap = true
}

provider "rancher2" {
  alias     = "admin"
  api_url   = join(".", ["https://rancher", module.outscale_k3s.k3s_node_public_ip, "sslip.io"])
  insecure  = true
  token_key = module.helm_rancher.rancher_bootstrap_admin_token
  timeout   = "300s"
}

provider "tls" {
}
