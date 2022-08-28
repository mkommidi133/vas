resource "google_folder" "customer" {
  count        = var.create_customer_folder ? 1 : 0
  display_name = var.customer_folder_name
  parent       = "folders/${var.offer_folder_id}"
}

resource "google_folder" "customer_env" {
  for_each = {
    for env in var.customer_envs : env => env
    if var.create_customer_environment_folder == true
  }

  display_name = each.value
  parent       = var.create_customer_folder ? "folders/${google_folder.customer[0].folder_id}" : "folders/${var.customer_folder_id}"
  depends_on   = [google_folder.customer]
}

resource "google_service_account" "execute_sa" {
  for_each = {
    for env in var.customer_envs : env => env
    if var.create_sa == true
  }

  account_id   = "tf-exe-${var.customer_sa_account}-${each.value}"
  display_name = "Service account for ${var.customer_folder_name} ${each.value} environment"
  project      = var.sa_project_id
  depends_on   = [google_folder.customer_env]
}

resource "google_folder_iam_member" "execute_sa_folder_bindings" {
  for_each = {
    for env in var.customer_envs : env => env
    if var.create_sa == true
  }

  folder = "folders/${google_folder.customer_env[each.value].folder_id}"
  role   = "roles/resourcemanager.folderCreator"
  member = "serviceAccount:${google_service_account.execute_sa[each.value].email}"
}

resource "google_folder_iam_member" "execute_sa_project_bindings" {
  for_each = {
    for env in var.customer_envs : env => env
    if var.create_sa == true
  }

  folder = "folders/${google_folder.customer_env[each.value].folder_id}"
  role   = "roles/resourcemanager.projectCreator"
  member = "serviceAccount:${google_service_account.execute_sa[each.value].email}"
}

resource "google_folder_iam_member" "execute_sa_xpn_bindings" {
  for_each = {
    for env in var.customer_envs : env => env
    if var.create_sa == true
  }

  folder = "folders/${google_folder.customer_env[each.value].folder_id}"
  role   = "roles/compute.xpnAdmin"
  member = "serviceAccount:${google_service_account.execute_sa[each.value].email}"
}

resource "google_project_iam_member" "execute_sa_images_binding" {
  for_each = {
    for env in var.customer_envs : env => env
    if var.create_sa == true
  }

  project = var.artifact_project
  role    = "roles/compute.imageUser"
  member  = "serviceAccount:${google_service_account.execute_sa[each.value].email}"
}

resource "google_billing_account_iam_member" "execute_sa_billing_bindings" {
  for_each = {
    for env in var.customer_envs : env => env
    if var.create_sa == true
  }

  billing_account_id = var.billing_account_id
  member             = "serviceAccount:${google_service_account.execute_sa[each.value].email}"
  role               = "roles/billing.user"
}

resource "google_service_account" "token_sa" {
  for_each = {
    for env in var.customer_envs : env => env
    if var.create_sa == true
  }

  account_id   = "tf-tkn-${var.customer_sa_account}-${each.value}"
  display_name = "Service account for ${var.customer_folder_name} ${each.value} environment"
  project      = var.sa_project_id
  depends_on   = [google_folder.customer_env]
}

resource "google_service_account_iam_binding" "token_sa_bindings" {
  for_each = {
    for env in var.customer_envs : env => env
    if var.create_sa == true
  }

  service_account_id = google_service_account.execute_sa[each.value].name
  role               = "roles/iam.serviceAccountTokenCreator"
  members = [
    "serviceAccount:${google_service_account.token_sa[each.value].email}"
  ]
}

resource "google_service_account_key" "token_sa_keys" {
  for_each = {
    for env in var.customer_envs : env => env
    if var.create_sa == true
  }

  service_account_id = google_service_account.token_sa[each.value].name
}
