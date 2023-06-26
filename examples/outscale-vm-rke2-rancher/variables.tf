variable "cert_manager_version" {
  type        = string
  description = "Version of cert-manager to install alongside Rancher (format: 0.0.0)"
  default     = "1.10.0"
}

# see https://docs.outscale.com/en/userguide/Instance-Types.html
variable "instance_type" {
  type        = string
  description = "Instance type used for all VM"
  default     = "tinav3.c4r8p2"
}

# see https://docs.outscale.com/en/userguide/Official-OMIs-Reference.html
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

# see https://github.com/k3s-io/k3s/releases
variable "rancher_kubernetes_version" {
  type        = string
  description = "Kubernetes version to use for Rancher server cluster"
  default     = "v1.24.13+k3s1"
}

variable "rancher_server_admin_password" {
  type        = string
  description = "Admin password to use for Rancher server bootstrap, min. 12 characters"
}

variable "rancher_version" {
  type        = string
  description = "Rancher server version (format: 0.0.0)"
  default     = "2.7.3"
}

# see https://github.com/rancher/rke2/releases
variable "workload_kubernetes_version" {
  type        = string
  description = "Kubernetes version to use for managed workload cluster"
  default     = "v1.24.13+rke2r1"
}
