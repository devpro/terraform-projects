# Azure

## Create a service principal

A service principal, aka Azure AD Application, is used to authenticate a user.

Execute the following commands and store the client ID and client secret (ref. [Azure Provider: Authenticating using a Service Principal with a Client Secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret)).

```bash
az login
az ad sp create-for-rbac --name "<myusername>-tf-may2023" --role="Contributor" --scopes="/subscriptions/<subscription_id>"
```

## Set ARM environment variables

Set the following environment variables (replace with values from the Service Principal) so that Terraform ARM provider can execute against Azure (ref. [Configuring the Service Principal in Terraform](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret#configuring-the-service-principal-in-terraform)).

For Linux systems:

```bash
export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
export ARM_CLIENT_SECRET="12345678-0000-0000-0000-000000000000"
export ARM_TENANT_ID="10000000-0000-0000-0000-000000000000"
export ARM_SUBSCRIPTION_ID="20000000-0000-0000-0000-000000000000"
```

For Windows systems:

```bat
set ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
set ARM_CLIENT_SECRET="12345678-0000-0000-0000-000000000000"
set ARM_TENANT_ID="10000000-0000-0000-0000-000000000000"
set ARM_SUBSCRIPTION_ID="20000000-0000-0000-0000-000000000000"
```
