variable "environment" {
  description = "Name of the environment, which a new pet name follows when changed"
  type        = string
  default     = "demo"
}

variable "release" {
  description = "Release number, which replaces the deployment record when changed"
  type        = string
  default     = "1"
}
