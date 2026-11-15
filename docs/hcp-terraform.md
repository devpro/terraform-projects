# HCP Terraform

[HCP Terraform](https://developer.hashicorp.com/terraform/cloud-docs) stores the state and runs plans and applies on a remote runner.

Any example runs there unchanged, as the connection is set outside the configuration.

[state-only](../examples/state-only/README.md) needs no credentials, so it suits a first try on the free plan.

## Execution

Runs execute remotely by default, on a temporary runner deleted after each run.
A file written by a resource or a provisioner is lost with the runner.
Provider credentials, such as `ARM_CLIENT_ID`, are set as environment variables of the workspace.

## CLI-driven workflow

The CLI uploads the configuration and streams the logs of the remote run.
The `cloud` block lives in a `cloud_override.tf` file, ignored by Git, so the example stays agnostic.

```bash
# stores an API token in ~/.terraform.d/credentials.tfrc.json
terraform login

cd examples/state-only
printf 'terraform {\n  cloud {}\n}\n' > cloud_override.tf

# selects the organization and the workspace, created on first init
export TF_CLOUD_ORGANIZATION="<organization>"
export TF_WORKSPACE="state-only"

terraform init
terraform apply
```

A local state already in the folder is offered for migration during `terraform init`.

## VCS-driven workflow

HCP Terraform runs on every push to a Git repository, with no `cloud` block at all.

1. Create a workspace with **Version Control Workflow** and connect the repository
2. In **Settings > General**, set the **Terraform Working Directory** to the example folder, such as `examples/state-only`
3. Push a change to the default branch, a run starts and waits for confirmation in the web interface

A pull request starts a speculative plan, reported as a check on the pull request.

## Web interface

* **Runs**: every plan and apply, with its logs and the user who started it
* **States**: one version per apply, with a diff between versions
* **Variables**: Terraform variables and environment variables applied to every run

## Clean up

Run `terraform destroy`, or queue a destroy plan in **Settings > Destruction and Deletion**, before deleting the workspace.
