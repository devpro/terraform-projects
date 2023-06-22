# AKS with Rancher

Create an Azure Kubernetes Service (Kubernetes cluster managed by Azure) and install Rancher on it.

## How to use

* If not already done, [create a service principal in Azure AD](../../docs/azure.md#create-a-service-principal)

* [Set ARM (Azure Resource Manager) environment variables](../../docs/azure.md#set-arm-environment-variables)

* Set the Terraform variables (by creating a file `terraform.tfvars` for example)

Name                    | Required | Reason
------------------------|----------|---------------------------------------------
`azure_location`        | False    | Azure data center location for the resources
`azure_resource_suffix` | False    | Suffix used in Azure resources
`aks_node_count`        | False    | Number of AKS worker nodes
`azure_vm_size`         | False    | Azure Virtual Machine size

* [Execute Terraform commands](../../docs/terraform-cli.md#run-commands)
