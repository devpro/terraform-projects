# RKE2 cluster on Outscale Cloud VM with Rancher

Create a RKE2 cluster on Outscale Cloud and install Rancher and install Rancher on it.

## How to use

* [Set Outscale environment variables](../../docs/outscale.md#set-environment-variables)

* Set the Terraform variables (by creating a file `terraform.tfvars` for example)

Name                    | Required | Reason
------------------------|----------|---------------------------------------------
`azure_location`        | False    | Azure data center location for the resources

* [Execute Terraform commands](../../docs/terraform-cli.md#run-commands)

* Open Rancher (the host is given as Terraform output)
