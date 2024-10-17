resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  name = "${var.container_name}-${count.index+1}"
  count = var.container_count
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = "808${count.index}"
  }
  # volumes {
  #   container_path  = "/usr/share/nginx/html"
  #   host_path       = "/home/scrapbook/tutorial/www"
  #   read_only       = true
  # }
}
