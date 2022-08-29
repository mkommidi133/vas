data "google_service_account_access_token" "tf_execute_sa" {
  provider               = google.impersonation
  target_service_account = local.sa_account
  scopes                 = ["userinfo-email", "cloud-platform"]
  lifetime               = "3600s"
}