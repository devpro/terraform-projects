resource "random_pet" "name" {
  keepers = {
    environment = var.environment
  }
}

resource "random_password" "admin" {
  length  = 20
  special = true
}

resource "time_static" "created" {
  triggers = {
    environment = var.environment
  }
}

resource "terraform_data" "deployment" {
  input            = "${random_pet.name.id} release ${var.release}"
  triggers_replace = [var.release]

  provisioner "local-exec" {
    command = "echo \"Deploying ${self.input} from $(hostname)\""
  }
}
