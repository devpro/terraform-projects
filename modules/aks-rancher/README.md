# Azure Kubernetes Service (AKS) with Rancher

Create an AKS resource (Kubernetes cluster managed by Azure) and install Rancher on it.

## How to use (minimalist approach)

* Create `main.tf` file in a new folder

```terraform
module "aks-rancher" {
  source = "github.com/devpro/terraform-projects//modules/aks-rancher"
}

provider "azurerm" {
  features {}
}

provider "helm" {
}
```

* [Run Terraform commands](../../docs/terraform-cli.md#run-commands)

## Input variables

Name                             | Mandatory | Description
---------------------------------|-----------|--------------------------------------------------------------------------
`azure_location`                 | True      | Location of the Azure datacenter
`azure_vm_size`                  | True      | Azure VM size
`cert_manager_version`           | False     | Version of cert-manager to install on the cluster (mandatory for Rancher)
`kube_api_access_authorized_ips` | True      | Authorized IP ranges to access Kubernetes API server
`node_count`                     | True      | AKS node count (pool of worker nodes)
`rancher_version`                | False     | Version of rancher to install on the cluster
`resource_suffix`                | True      | Resource name suffix
`resource_tags`                  | False     | List of tags (key => value) to create on resources

## Outputs

Name                 | Value
---------------------|-------------------
`client_certificate` | Client certificate
`kube_config`        | Kubernetes config
`load_balancer_ip`   | Load balancer IP
`rancher_host`       | Rancher host

## Examples

* [aks-rancher](../../examples/aks-rancher/README.md)

## Debug

* Make sure Ingress is working

```bash
NGINX_PUBLIC_IP=`kubectl get service -n ingress-nginx ingress-nginx-controller --output jsonpath='{.status.loadBalancer.ingress[0].ip}'`
helm repo add devpro https://devpro.github.io/helm-charts
helm install cow-demo devpro/cow-demo --set ingress.enabled=true --set host=cow-demo.${NGINX_PUBLIC_IP}.sslip.io --namespace demo --create-namespace
curl -Lk cow-demo.${NGINX_PUBLIC_IP}.sslip.io
```

## References

* AKS
  * [Create an AKS cluster by using Terraform (Azure)](https://learn.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-terraform?tabs=azure-cli)
  * [Provision an AKS Cluster (Terraform)](https://developer.hashicorp.com/terraform/tutorials/kubernetes/aks)
  * [Deploy Applications with the Helm Provider (Terraform)](https://developer.hashicorp.com/terraform/tutorials/kubernetes/helm-provider)
  * [Issue#14849](https://github.com/hashicorp/terraform-provider-azurerm/issues/14849)
* Rancher
  * [Install/Upgrade Rancher on a Kubernetes Cluster](https://ranchermanager.docs.rancher.com/v2.6/pages-for-subheaders/install-upgrade-on-a-kubernetes-cluster)
* Kubernetes / Helm
  * [terraform-iaac](https://github.com/terraform-iaac)
