terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0, < 7.0"
    }
  }
  # backend "gcs" {
  #   bucket = "terraform-poc-1"
  # }
}

locals {
  stack_name = "terraform-poc"
  project_id = "third-index-438904-k2"
  region     = "us-central1"
}

provider "google" {
  project = local.project_id
  region  = local.region
  # credentials = file("gcp-credentials.json")
}

module "vpc-poc-1" {
  source       = "./poc/vpc"
  project_id   = local.project_id
  region       = local.region
  network_name = "${local.stack_name}-vpc-poc"
}