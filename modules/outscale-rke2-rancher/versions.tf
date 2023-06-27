terraform {
  required_providers {
    # https://github.com/hashicorp/terraform-provider-helm
    helm = {
      source  = "hashicorp/helm"
      version = "2.5.1"
    }
    # https://github.com/hashicorp/terraform-provider-local
    local = {
      source  = "hashicorp/local"
      version = "2.2.3"
    }
    # https://github.com/loafoe/terraform-provider-ssh
    ssh = {
      source  = "loafoe/ssh"
      version = "2.6.0"
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
  required_version = ">= 1.0.0"
}
