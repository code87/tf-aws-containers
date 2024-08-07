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

module "my_repo" {
  source = "../modules/ecr-repo"

  name        = "my_repo"
  keep_images = 2
}

output "repository_url" {
  value = module.my_repo.repository_url
}
