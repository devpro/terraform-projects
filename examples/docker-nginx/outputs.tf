output "container_id" {
  description = "ID of the Docker container"
  value       = [ for container in docker_container.nginx : container.id ]
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.nginx.id
}
