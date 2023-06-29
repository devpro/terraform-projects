variable "outscale_subregion" {
  description = "OUTSCALE Cloud region"
  type        = string
  default     = "eu-west-2a"
}

resource "outscale_volume" "sample" {
  subregion_name = var.outscale_subregion
  volume_type    = "io1"
  iops           = 1000
  size           = 200
}

output "outscale_sample_volume_id" {
  value = outscale_volume.sample.id
}
