# K3s cluster on Outscale Cloud

This module will create a [K3s](https://k3s.io/) cluster on Outscale Cloud. The following resources will be created:

- 1x Public IP
- 1x Security Group
- 1x Virtual Machine

## Inputs

Name                  | Mandatory | Description
----------------------|-----------|------------------------------------------------
`creator`             | True      | Creator of Outscale Cloud resources
`kubernetes_version`  | False     | K3s version to install
`node_username`       | True      | Username used for SSH access to the VM
`resource_prefix`     | False     | Prefix added to names of all resources
`ssh_private_key_pem` | False     | Private key used for SSH access to the VM
`ssh_public_key`      | False     | Public key used for SSH access to the VM
`vm_image`            | False     | Outscale machine Image to use for all instances
`vm_type`             | False     | Outscale VM type used for all VM

## Outputs

Name                    | Value
------------------------|------------------------------
`k3s_node_public_ip`    | Public IP of the cluster
`kubeconfig_local_file` | Kube configuration local file
`security_group_id`     | Security group Id
