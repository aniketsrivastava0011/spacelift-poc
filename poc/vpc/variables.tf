variable "project_id" {
  description = "The project ID to host the network in"
}

variable "region" {
  description = "Enter the name of the region eg: us-central1"
  type = string
}

variable "network_name" {
  description = "The name of the first VPC network being created"
  type        = string
}
