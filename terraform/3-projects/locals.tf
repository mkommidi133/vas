locals {
  sa_account = var.sa_account

  project_labels = {
    "offer"       = var.offer_name
    "env"         = var.environment_name
    "cost_center" = var.cost_center
    "contact"     = var.contact_name
    "bu"          = var.business_unit
  }

  service_apis = [
    "compute.googleapis.com",
    "osconfig.googleapis.com",
    "oslogin.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "iap.googleapis.com",
    "redis.googleapis.com",
    "container.googleapis.com",
    "sqladmin.googleapis.com",
    "servicenetworking.googleapis.com",
    "file.googleapis.com"
  ]

  secrets_apis = [
    "secretmanager.googleapis.com",
  ]

}