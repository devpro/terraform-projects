# These resources live only in the state, so they need no infrastructure
# and show what the state keeps between runs, wherever Terraform runs.

resource "random_pet" "name" {
  keepers = {
    environment = var.environment
  }
}

# Shows how a sensitive value is masked in plans and outputs.
resource "random_password" "admin" {
  length  = 20
  special = true
}

# Stays the same on every later run, as the timestamp is read back from the state.
resource "time_static" "created" {
  triggers = {
    environment = var.environment
  }
}

resource "terraform_data" "deployment" {
  input            = "${random_pet.name.id} release ${var.release}"
  triggers_replace = [var.release]

  # Runs on the machine that applies, so its output appears in the apply log and names that machine.
  provisioner "local-exec" {
    command = "echo \"Deploying ${self.input} from $(hostname)\""
  }
}
