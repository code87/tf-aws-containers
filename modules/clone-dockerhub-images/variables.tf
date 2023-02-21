variable "images" {
  description = "List of Docker Hub images with versions specified. Example: [\"ruby:2.7.5\", \"postgres:13.8\"]"
  type        = list(string)
}
