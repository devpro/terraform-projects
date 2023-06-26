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

resource "outscale_volume" "my_data" {
  subregion_name = "eu-west-2a"
  volume_type    = "io1"
  iops           = 10000
  size           = 200
}
