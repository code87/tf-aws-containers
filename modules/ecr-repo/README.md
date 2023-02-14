# ECR Repo

Terraform module for creating AWS ECR Repository.


## Usage

```terraform
module "my_repo" {
  source = "github.com/code87/tf-aws-containers//modules/ecr-repo?ref=v0.0.1"

  name        = "my_repo"
  keep_images = 5
}
```


## Requirements

| Name        | Version           |
|-------------|-------------------|
| `terraform` | >= 1.0.0, < 2.0.0 |
| `aws`       | ~> 4.0            |


## Resources

| Name              | Type                       |
|-------------------|----------------------------|
| `repository`      | `aws_ecr_repository`       |
| `lifecycle_policy`| `aws_ecr_lifecycle_policy` |


## Inputs

| Name          | Description                     | Type     | Default | Required |
|---------------|---------------------------------|----------|---------|----------|
| `name`        | ECR repository name             | `string` |         | yes      |
| `keep_images` | Number of recent images to keep | `number` | `3`     | no       |


## Outputs

| Name             | Description           |
|------------------|-----------------------|
| `repository_url` | URL to ECR repository |