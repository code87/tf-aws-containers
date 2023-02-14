# Terraform AWS ECR Repo

Terraform module for creating AWS ECR Repository.


## Usage


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


## License

Apache 2 Licensed. See [LICENSE](LICENSE) for full details.
