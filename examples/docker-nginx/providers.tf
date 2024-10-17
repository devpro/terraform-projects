terraform {
  required_version = ">= 1.1.0"

  # https://registry.terraform.io/providers/kreuzwerker/docker/latest
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  # default
  # host = "tcp://docker:2345/"
  # for Windows
  # host = "npipe:////.//pipe//docker_engine"
  # for Linux
  # host = "unix:///var/run/docker.sock"
}
