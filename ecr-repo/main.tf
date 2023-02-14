resource "aws_ecr_repository" "repository" {
  name                 = var.name
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  tags = {
    Name = var.name
  }
}

resource "aws_ecr_lifecycle_policy" "lifecycle_policy" {
  repository = aws_ecr_repository.repository.name

  policy = <<EOF
  {
    "rules": [
        {
            "rulePriority": 1,
            "description": "Keep last ${var.keep_images} images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["v"],
                "countType": "imageCountMoreThan",
                "countNumber": ${var.keep_images}
            },
            "action": {
                "type": "expire"
            }
        }
    ]
  }
  EOF
}
