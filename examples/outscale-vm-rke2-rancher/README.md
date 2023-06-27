# Rancher quickstart on Outscale Cloud

This project demonstrates how to setup Rancher on Outscale Cloud. It will install two Kubernetes cluster:

* `Management`: k3s single-node cluster on which Rancher is installed
* `Workload`: RKE2 single-node cluster managed by Rancher (import)

## How to use

* [Configure Outscale Cloud provider](../../docs/outscale.md#set-environment-variables)

* [Set Terraform input variables](../../docs/terraform-cli.md#configure-input-variables)

Name                            | Required | Reason
--------------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------
`cert_manager_version`          | False    | Version of cert-manager to install alongside Rancher
`instance_type`                 | False    | Outscale instance type used for all Virtual Machines (see [Instance types](https://docs.outscale.com/en/userguide/Instance-Types.html))
`omi`                           | False    | Outscale machine image to use for all instances (see [OMI reference](https://docs.outscale.com/en/userguide/Official-OMIs-Reference.html))
`prefix`                        | False    | Prefix added to names of all resources
`rancher_helm_repository`       | False    | The helm repository, where the Rancher helm chart is installed from
`rancher_kubernetes_version`    | False    | K3s version to use for Rancher server cluster (see [k3s/releases](https://github.com/k3s-io/k3s/releases))
`rancher_server_admin_password` | True     | Admin password to use for Rancher server bootstrap
`rancher_version`               | False    | Rancher server version
`workload_kubernetes_version`   | False    | RKE2 version to use for managed workload cluster (see [rke2/releases](https://github.com/rancher/rke2/releases))

* [Run Terraform commands](../../docs/terraform-cli.md#run-commands)

* (Optional) [debug Outscale Cloud resources](../../docs/outscale.md#debug)

* Open Rancher (the host is given as Terraform output)
