config {
  module     = false
  plugin_dir = "~/.tflint.d/plugins"
}

plugin "azurerm" {
  enabled = true
  version = "0.24.0"
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

rule "terraform_required_version" {
  enabled = false
}

rule "terraform_required_providers" {
  enabled = false
}
