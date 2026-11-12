terraform {
  required_version = ">= 1.1.0"

  required_providers {
    # https://github.com/hashicorp/terraform-provider-helm
    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.3"
    }
    # https://github.com/hashicorp/terraform-provider-tls
    tls = {
      source  = "hashicorp/tls"
      version = "4.4.2"
    }
    # https://github.com/outscale/terraform-provider-outscale
    outscale = {
      source  = "outscale/outscale"
      version = "1.8.1"
    }
    # https://github.com/rancher/terraform-provider-rancher2
    rancher2 = {
      source  = "rancher/rancher2"
      version = "15.1.2"
    }
  }
}

provider "helm" {
  kubernetes = {
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
