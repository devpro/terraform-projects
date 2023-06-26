# Terraform CLI

## Set trace level

Logging level can be TRACE, INFO, WARN.

For Linux systems:

```bash
export TF_LOG="TRACE"
```

For Windows systems:

```bat
set TF_LOG="TRACE"
```

## Build commands

```bash
# formats code
terraform fmt
```

## Run commands

```bash
# initializes local Terraform folder
terraform init

# displays changes that are identified
terraform plan

# creates and updates resources
terraform apply -auto-approve

# deletes resources
terraform destroy
```
