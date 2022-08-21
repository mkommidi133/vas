terraform {
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
 access_token    = data.google_service_account_access_token.tf_execute_sa.access_token
  request_timeout = "3600s"
}

provider "google-beta" {
  access_token    = data.google_service_account_access_token.tf_execute_sa.access_token
  request_timeout = "3600s"
}

provider "google" {
  alias = "impersonation"
  credentials = "vas-offer-services-360018-7a8d9ce5a46d.json"
  scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email",
  ]
  project      = "astral-root-360018"
}