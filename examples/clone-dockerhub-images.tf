terraform {
  required_version = "~> 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "alpine" {
  source = "../modules/ecr-repo"

  name   = "alpine"
}

module "busybox" {
  source = "../modules/ecr-repo"

  name   = "busybox"
}

module "clone_images" {
  source = "../modules/clone-dockerhub-images"

  images = ["alpine:latest", "busybox:1.36.1"]

  depends_on = [
    module.busybox,
    module.alpine
  ]
}

output "alpine" {
  value = module.alpine.repository_url
}

output "busybox" {
  value = module.busybox.repository_url
}
