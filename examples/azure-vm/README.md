# Azure VM with Terraform

Manage Azure resources with Terraform (inspired by [Get Started - Azure](https://developer.hashicorp.com/terraform/tutorials/azure-get-started)
and [Azure RM Provider Examples](https://github.com/hashicorp/terraform-provider-azurerm/tree/main/examples)).

## Steps

* Create a service principal, aka Azure AD Application (store the client ID and client secret)

```bash
az login
az ad sp create-for-rbac --name "<myusername>-tf-may2023" --role="Contributor" --scopes="/subscriptions/<subscription_id>"
```

* Set ARM environment variables

```bash
export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
export ARM_CLIENT_SECRET="12345678-0000-0000-0000-000000000000"
export ARM_TENANT_ID="10000000-0000-0000-0000-000000000000"
export ARM_SUBSCRIPTION_ID="20000000-0000-0000-0000-000000000000"
```

* Get local files

```bash
terraform init
```

* Create `terraform.tfvars` with your variables

* Create and manage resources

```bash
terraform apply
```

* Delete resources

```bash
terraform destroy
```
