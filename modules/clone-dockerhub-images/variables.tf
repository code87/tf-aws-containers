variable "images" {
  description = "List of Docker Hub images with versions specified. Example: [\"ruby:2.7.5\", \"postgresql:13.2\"]"
  type        = list(string)
}
