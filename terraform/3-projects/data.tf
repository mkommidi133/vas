data "google_service_account_access_token" "tf_execute_sa" {
  provider               = google.impersonation
  target_service_account = local.sa_account
  scopes                 = ["userinfo-email", "cloud-platform"]
  lifetime               = "3600s"
}

data "terraform_remote_state" "workspaces" {
  backend = "remote"

  config = {
    organization = "monisra"
    workspaces = {
      name = "vas-${var.customer_name}-workspaces-${var.environment_name}"
    }
  }
}

data "terraform_remote_state" "host-infra" {
  backend = "remote"

  config = {
    organization = "monisra"
    workspaces = {
      name = "vas-avaya-${var.customer_name}-hostinfra-${var.environment_name}"
    }
  }
}