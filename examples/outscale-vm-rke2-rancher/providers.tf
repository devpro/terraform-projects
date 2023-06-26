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
  }
}

# provider "helm" {
#   kubernetes {
#     config_path = local_file.kube_config_server_yaml.filename
#   }
# }

provider "outscale" {
}

# provider "rancher2" {
#   alias     = "bootstrap"
#   api_url   = "https://${var.rancher_server_dns}"
#   insecure  = true
#   bootstrap = true
# }

# provider "rancher2" {
#   alias     = "admin"
#   api_url   = "https://${var.rancher_server_dns}"
#   insecure  = true
#   token_key = rancher2_bootstrap.admin.token
#   timeout   = "300s"
# }

provider "tls" {
}
