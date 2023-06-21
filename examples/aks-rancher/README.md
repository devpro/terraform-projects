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

* Execute Terraform commands

```bash
# Initialize local Terraform folder
terraform init

# Create and manage resources
terraform apply

# Delete resources
terraform destroy
```
