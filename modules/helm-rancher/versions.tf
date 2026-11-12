terraform {
  required_providers {
    # https://github.com/hashicorp/terraform-provider-helm
    helm = {
      source  = "hashicorp/helm"
      version = "3.3.0"
    }
    # https://github.com/rancher/terraform-provider-rancher2
    rancher2 = {
      source  = "rancher/rancher2"
      version = "15.1.2"
    }
  }
  required_version = ">= 1.0.0"
}
