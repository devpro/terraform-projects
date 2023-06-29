variable "creator" {
  type        = string
  description = "Creator of Outscale Cloud resources"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version to install"
  default     = "v1.24.13+k3s1"
}

variable "node_username" {
  type        = string
  description = "Username used for SSH access to the Kubernetes cluster node"
}

variable "resource_prefix" {
  type        = string
  description = "Prefix added to names of all resources"
  default     = "quickstart"
}

variable "ssh_private_key_pem" {
  type        = string
  description = "Private key used for SSH access to the Kubernetes cluster node"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key for SSH access to the Kubernetes cluster node"
}

variable "vm_image" {
  type        = string
  description = "Outscale machine Image to use for all instances"
  default     = "ami-504e6b16"
}

variable "vm_type" {
  type        = string
  description = "Instance type used for all VM"
  default     = "tinav3.c4r8p2"
}
