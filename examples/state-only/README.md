# State-only resources

A Terraform project with resources that only exist in the Terraform state (no need for infractruture or credentials).

## Resources

Resource                    | Behaviour
----------------------------|--------------------------------------------------------------------
`random_pet.name`           | A name kept in the state, new only when `environment` changes
`random_password.admin`     | A sensitive value, masked in plans and outputs
`time_static.created`       | The time of the first apply, identical on every later run
`terraform_data.deployment` | A record replaced when `release` changes, with a command in the log

> [!NOTE]
> No file is written on disk, as a file would be lost on a runner deleted after each run, and every following plan would create it again.

## Steps

Load providers:

```bash
terraform init
```

Create the plan:

```bash
terraform plan
```

Creates the resources in the state:

```bash
terraform apply
```

Read the outputs:

```bash
terraform output
# terraform output -raw admin_password
```

Lists resources:

```bash
terraform state list
```

Clean-up:

```bash
terraform destroy
```
