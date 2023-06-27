terraform {
  required_providers {
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
  }
  required_version = ">= 1.0.0"
}
