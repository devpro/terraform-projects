# Outscale Rancher RKE2 provisioning

This module will create a RKE2 cluster managed by Rancher on Outscale Cloud. The following resources will be created:

- 1x Public IP
- 1x Security Group
- 1x Virtual Machine

## Inputs

Name                          | Mandatory | Description
------------------------------|-----------|---------------------------------------------------------------
`instance_type`               | False     | Instance type used for all VM
`node_username`               | True      | Username used for SSH access to the Kubernetes cluster node
`omi`                         | False     | Outscale machine Image to use for all instances
`prefix`                      | False     | Prefix added to names of all resources
`security_group_id`           | True      | Security group IP
`ssh_private_key_pem`         | True      | Private key used for SSH access to the Kubernetes cluster node
`ssh_public_key`              | True      | SSH public key for SSH access to the Kubernetes cluster node
`workload_cluster_name`       | True      | Name for created custom workload cluster
`workload_kubernetes_version` | False     | Kubernetes version to use for managed workload cluster

## Outputs

Name               | Value
-------------------|-----------------
`workload_node_ip` | Workload node IP
