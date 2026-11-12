# State-only resources

Resources that exist only in the Terraform state, so the configuration runs without any infrastructure or credentials.
It shows what the state keeps between runs, and runs the same way locally or on a remote runner.

## Resources

Resource                     | Behaviour
-----------------------------|-------------------------------------------------------------------
`random_pet.name`            | A name kept in the state, new only when `environment` changes
`random_password.admin`      | A sensitive value, masked in plans and outputs
`time_static.created`        | The time of the first apply, identical on every later run
`terraform_data.deployment`  | A record replaced when `release` changes, with a command in the log

No file is written on disk, as a file would be lost on a runner deleted after each run,
and every following plan would create it again.

## Steps

```bash
# loads providers
terraform init

# creates the resources in the state
terraform apply

# reads the outputs, the password only on demand
terraform output
terraform output -raw admin_password

# finds no change, as every value is read back from the state
terraform plan

# replaces only the deployment record, created_at stays the same
terraform apply -var "release=2"

# generates a new pet name and creation time
terraform apply -var "environment=staging"

# lists resources
terraform state list

terraform destroy
```
