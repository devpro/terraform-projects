# Rancher installation with Helm

This module will install [rancher](https://www.rancher.com/) on an existing Kubernetes cluster with [Helm](https://helm.sh/). As part of the installation, [cert-manager](https://cert-manager.io/) will also be installed.

## Inputs

Name                      | Mandatory | Description
--------------------------|-----------|---------------------------------------------------
`admin_password`          | False     | Admin password to use for Rancher server bootstrap
`cert_manager_version`    | False     | Version of cert-manager to install
`rancher_helm_repository` | False     | rancher_helm_repository
`rancher_server_dns`      | True      | DNS host name of the Rancher server
`rancher_version`         | False     | Version of Rancher server to install

## Outputs

Name                            | Value
--------------------------------|-----------------------------
`rancher_bootstrap_admin_token` | Rancher bootsrap admin token
`rancher_url`                   | Rancher URL
