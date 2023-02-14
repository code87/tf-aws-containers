variable "name" {
  description = "ECR repository name"
  type = string
}

variable "keep_images" {
  description = "Number of recent images to keep"
  type = number
  default = 3
}
