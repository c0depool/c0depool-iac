terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.22.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.gcp_credentials_file)
}