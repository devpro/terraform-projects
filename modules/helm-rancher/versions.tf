terraform {
  required_providers {
    # https://github.com/hashicorp/terraform-provider-helm
    helm = {
      source  = "hashicorp/helm"
      version = "2.5.1"
    }
    # https://github.com/rancher/terraform-provider-rancher2
    rancher2 = {
      source  = "rancher/rancher2"
      version = "3.0.0"
    }
  }
  required_version = ">= 1.0.0"
}
