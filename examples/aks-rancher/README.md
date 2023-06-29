# AKS (Azure Kubernetes Service) with Rancher

This project will create a Kubernetes cluster managed by Azure and install Rancher on it.

## How to use

* If not already done, [create a service principal in Azure AD](../../docs/azure.md#create-a-service-principal)

* [Configure ARM (Azure Resource Manager) provider](../../docs/azure.md#set-arm-environment-variables)

* [Set Terraform input variables](../../docs/terraform-cli.md#configure-input-variables)

Name                    | Required | Reason
------------------------|----------|-----------------------------------------------------------
`admin_ip_ranges`       | True     | IP ranges used by administrators (example: ["1.2.3.4/32"])
`aks_node_count`        | False    | Number of AKS worker nodes
`azure_location`        | False    | Azure data center location for the resources
`azure_resource_suffix` | False    | Suffix used in Azure resources
`azure_vm_size`         | False    | Azure Virtual Machine size

* [Run Terraform commands](../../docs/terraform-cli.md#run-commands)

* Open Rancher (the host is given as Terraform output)
