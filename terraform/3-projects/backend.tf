terraform {
  required_version = ">=0.13.0"
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "monisra"
    workspaces {
      prefix = "vas-"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.5.0, < 5.0.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 3.5.0, < 5.0.0"
    }
  }
}

provider "google" {
  alias = "impersonation"
  scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email",
  ]
}

provider "google" {
  access_token    = data.google_service_account_access_token.tf_execute_sa.access_token
  request_timeout = "1800s"
}

provider "google-beta" {
  access_token    = data.google_service_account_access_token.tf_execute_sa.access_token
  request_timeout = "1800s"
}
 