# Contibuting guide

## How to provide feedback

_TL;DR_ Create Issues on this repository

## How to promote

_TL;DR_ Share on social media

## How to make a code change

_TL;DR_ Fork this repository and create Pull Requests

### Conventions

* HashiCorp
  * Terraform Configuration Language
    * [Creating Modules](https://developer.hashicorp.com/terraform/language/modules/develop)
    * [Files and Directories](https://developer.hashicorp.com/terraform/language/files)
    * [Syntax](https://developer.hashicorp.com/terraform/language/syntax)
* Google Cloud
  * [Best practices for using Terraform](https://cloud.google.com/docs/terraform/best-practices-for-terraform)

See also [terraform-best-practices.com](https://www.terraform-best-practices.com/)

### Code analysis

This checks will be done in the [CI pipeline](.github/workflows/ci.yaml) but it's always good to check code quality before committing.

```bash
# checks format (ref. https://developer.hashicorp.com/terraform/cli/commands/fmt)
terraform fmt -recursive -check

# runs Checkov (ref. https://www.checkov.io/)
alias checkov="docker run -it --rm --volume $(pwd):/src --workdir /src bridgecrew/checkov"
checkov --directory /src

# runs tfsec (ref. https://github.com/aquasecurity/tfsec)
alias tfsec="docker run --rm -it -v "$(pwd):/src" aquasec/tfsec"
tfsec /src

# runs TFLint (ref. https://github.com/terraform-linters/tflint)
md .tflint.d
alias tflint="docker run --rm -v $(pwd):/data -v $(pwd)/.tflint.d:/root/.tflint.d -it ghcr.io/terraform-linters/tflint"
tflint --recursive --init
tflint --recursive
```

### Inspirations

* [aws-observability/terraform-aws-observability-accelerator](https://github.com/aws-observability/terraform-aws-observability-accelerator)
* [bashofmann/rancher-demo-setups](https://github.com/bashofmann/rancher-demo-setups)
* [boeboe/terraform-azure-k3s](https://github.com/boeboe/terraform-azure-k3s)
* [David-VTUK/Rancher-K3s-vSphere](https://github.com/David-VTUK/Rancher-K3s-vSphere)
* [dsohk/rancher-devsecops-workshop](https://github.com/dsohk/rancher-devsecops-workshop)
* [dsohk/workshops](https://github.com/dsohk/workshops)
* [futurice/terraform-examples](https://github.com/futurice/terraform-examples)
* [hashicorp/terraform-provider-aws](https://github.com/hashicorp/terraform-provider-aws)
* [hashicorp/terraform-provider-azuread](https://github.com/hashicorp/terraform-provider-azuread)
* [hashicorp/terraform-provider-azurerm](https://github.com/hashicorp/terraform-provider-azurerm)
* [hashicorp/terraform-provider-google](https://github.com/hashicorp/terraform-provider-google)
* [hashicorp/terraform-guides](https://github.com/hashicorp/terraform-guides)
* [hashicorp/terraform-provider-kubernetes](https://github.com/hashicorp/terraform-provider-kubernetes)
* [linode/terraform-linode-k8s](https://github.com/linode/terraform-linode-k8s)
* [monterail/terraform-bootstrap-example](https://github.com/monterail/terraform-bootstrap-example)
* [outscale/osc-k8s-rke-cluster](https://github.com/outscale/osc-k8s-rke-cluster)
* [rancher/quickstart](https://github.com/rancher/quickstart)
* [shuaibiyy/awesome-terraform](https://github.com/shuaibiyy/awesome-terraform)
* [terraform-aws-modules/terraform-aws-s3-bucket](https://github.com/terraform-aws-modules/terraform-aws-s3-bucket)
* [terraform-google-modules/terraform-google-log-export](https://github.com/terraform-google-modules/terraform-google-log-export)
* [terraform-google-modules/terraform-google-project-factory](https://github.com/terraform-google-modules/terraform-google-project-factory)

### Additional tools to look at

* [config-lint](https://stelligent.github.io/config-lint/)

```bash
alias config-lint="docker run -it -v $(pwd):/src stelligent/config-lint"
config-lint -terraform /src
```

* [terraform-docs](https://terraform-docs.io/)
* [terraform-compliance](https://terraform-compliance.com/)
* [Terragrunt](https://terragrunt.gruntwork.io/) ([code](https://github.com/terraform-docs/terraform-docs))
* [Terratest](https://github.com/gruntwork-io/terratest)
