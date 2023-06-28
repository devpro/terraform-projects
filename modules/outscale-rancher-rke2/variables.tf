variable "instance_type" {
  type        = string
  description = "Instance type used for all VM"
  default     = "tinav3.c4r8p2"
}

variable "node_username" {
  type        = string
  description = "Username used for SSH access to the Kubernetes cluster node"
}

variable "omi" {
  type        = string
  description = "Outscale machine Image to use for all instances"
  default     = "ami-504e6b16"
}

variable "prefix" {
  type        = string
  description = "Prefix added to names of all resources"
  default     = "quickstart"
}

variable "security_group_id" {
  type        = string
  description = "Security group IP"
}

variable "ssh_private_key_pem" {
  type        = string
  description = "Private key used for SSH access to the Kubernetes cluster node"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key for SSH access to the Kubernetes cluster node"
}

variable "workload_cluster_name" {
  type        = string
  description = "Name for created custom workload cluster"
}

variable "workload_kubernetes_version" {
  type        = string
  description = "Kubernetes version to use for managed workload cluster"
  default     = "v1.24.13+rke2r1"
}
