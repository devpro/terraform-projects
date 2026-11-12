terraform {
  required_version = ">= 1.1.0"

  required_providers {
    # https://registry.terraform.io/providers/outscale/outscale/latest/docs
    outscale = {
      source  = "outscale/outscale"
      version = "0.9.1"
    }
  }
}

provider "outscale" {
}
