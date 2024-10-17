variable "container_name" {
  description = "Name for the container"
  type        = string
  default     = "nginx"
}

variable "container_count" {
  description = "Number of containers to be created"
  type        = number
  default     = 1
}
