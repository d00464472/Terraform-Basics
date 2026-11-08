
terraform {
    required_providers {
        docker = {
        source  = "kreuzwerker/docker"
        version = "~> 3.0.1"
        }
    }
}

provider "docker" {}

resource "docker_image" "api" {
    name         = "bubbaj/it4200-fall-2026:latest"
    keep_locally = false
}

resource "docker_container" "api" {
    name  = "class-api"
    image = docker_image.api.image_id

    ports {
        internal = 80
        external = 8000
    }
}
