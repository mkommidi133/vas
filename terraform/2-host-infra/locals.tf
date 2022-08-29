locals {
  sa_account = var.sa_account

  project_labels = {
    "offer"       = var.offer_name
    "cost_center" = var.cost_center
    "contact"     = var.contact_name
    "bu"          = var.business_unit
  }

  host_apis = [
    "compute.googleapis.com",
    "servicenetworking.googleapis.com",
    "dns.googleapis.com",
    "osconfig.googleapis.com",
    "oslogin.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "container.googleapis.com",
    "iap.googleapis.com",
  ]

  host_infra_subnets_regions = [for subnet in module.host_infra_subnets.subnets : subnet.region]
}