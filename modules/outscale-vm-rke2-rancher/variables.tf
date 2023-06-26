variable "admin_password" {
  type        = string
  description = "Admin password to use for Rancher server bootstrap, min. 12 characters"
}

variable "cert_manager_version" {
  type        = string
  description = "Version of cert-manager to install alongside Rancher (format: 0.0.0)"
  default     = "1.10.0"
}

variable "instance_type" {
  type        = string
  description = "Instance type used for all VM"
  default     = "tinav3.c4r8p2"
}

variable "node_username" {
  type        = string
  description = "Username used for SSH access to the Rancher server cluster node"
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

variable "rancher_helm_repository" {
  type        = string
  description = "The helm repository, where the Rancher helm chart is installed from"
  default     = "https://releases.rancher.com/server-charts/latest"
}

variable "rancher_server_dns" {
  type        = string
  description = "DNS host name of the Rancher server"
}

variable "rancher_version" {
  type        = string
  description = "Rancher server version (format v0.0.0)"
  default     = "2.7.3"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key"
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
