# Outscale Cloud

## Set environment variables

Set the following environment variables (replace with the right AK/SK) so that Terraform Outscale provider can execute against Outscale Cloud (ref. [docs](https://registry.terraform.io/providers/outscale/outscale/latest/docs#environment-variables)).

For Linux systems:

```bash
export OUTSCALE_ACCESSKEYID="XXXXXXXXXXXXXXXXXX"
export OUTSCALE_SECRETKEYID="YYYYYYYYYYYYYYYYYYYYYYYY"
export OUTSCALE_REGION="eu-west-2"
```

For Windows systems:

```bat
set OUTSCALE_ACCESSKEYID="XXXXXXXXXXXXXXXXXX"
set OUTSCALE_SECRETKEYID="YYYYYYYYYYYYYYYYYYYYYYYY"
set OUTSCALE_REGION="eu-west-2"
```

## Debug

### Connect to a Virtual Machine

```bash
ssh -i id_rsa outscale@<public_ip>
```
