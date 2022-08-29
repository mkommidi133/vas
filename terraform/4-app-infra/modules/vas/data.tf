data "google_project" "service_project" {
  project_id = var.service_project_id
}

# data "google_compute_global_address" "redis_name" {
#   name    = "vas-redis-ip"
#   project = var.service_project_id
# }
