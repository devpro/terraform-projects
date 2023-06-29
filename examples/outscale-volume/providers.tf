terraform {
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
