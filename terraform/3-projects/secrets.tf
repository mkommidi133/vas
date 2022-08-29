module "secret_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 11.3"

  name              = "${var.offer_name}-${var.environment_name}-${var.customer_abbr}-secret"
  random_project_id = true
  folder_id         = data.terraform_remote_state.workspaces.outputs.customer_env_folder_ids.folder_id[var.environment_name]
  org_id            = var.org_id
  billing_account   = var.billing_id
  labels            = local.project_labels
  activate_apis     = local.secrets_apis
}

resource "google_project_iam_binding" "viewer" {
  project = module.secret_project.project_id
  role    = "roles/viewer"
  members = var.secret_viewers
}

resource "random_password" "generate_password" {
  for_each = var.generate_passwords

  length      = 18
  lower       = true
  upper       = true
  numeric     = true
  special     = true
  min_lower   = "2"
  min_upper   = "3"
  min_numeric = "1"
  min_special = "3"
}

resource "google_secret_manager_secret" "secret_name" {
  for_each = var.generate_passwords

  secret_id = each.key
  labels    = each.value.labels
  project   = module.secret_project.project_id
  replication {
    user_managed {
      replicas {
        location = "us-west2"
      }
    }
  }
}

resource "google_secret_manager_secret_version" "secrets" {
  for_each = var.generate_passwords

  secret      = google_secret_manager_secret.secret_name[each.key].id
  secret_data = random_password.generate_password[each.key].result
}
