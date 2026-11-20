output "admin_password" {
  description = "Generated password, masked unless read explicitly"
  value       = random_password.admin.result
  sensitive   = true
}

output "created_at" {
  description = "Time of the first apply in this environment"
  value       = time_static.created.rfc3339
}

output "deployment" {
  description = "Deployment record of the current release"
  value       = terraform_data.deployment.output
}

output "pet_name" {
  description = "Name generated for the environment"
  value       = random_pet.name.id
}
