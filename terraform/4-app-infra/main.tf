module "vas" {
  source     = "./modules/vas"
  offer_name = var.offer_name
  #   customer_name      = var.customer_name
  service_project_id = data.terraform_remote_state.projects.outputs.service_project_id
  host_project_id    = data.terraform_remote_state.host-infra.outputs.host_infra_project_id
  customer_abbr      = var.customer_abbr
  #   service_account    = local.sa_account_email
  environment_name = var.environment_name
  primary_region   = var.primary_region
  zones            = data.google_compute_zones.zones.names
  network_name     = data.terraform_remote_state.host-infra.outputs.host_infra_network_name
  subnets_name     = local.subnet_name[0]
  gke_cluster      = var.gke_cluster_config

  #   cloud_sql           = var.cloud_sql_config
  #   psql_ip_range       = var.psql_ip_range
  #   network_self_link   = data.terraform_remote_state.host-infra.outputs.host_infra_network_self_link
  #   producer_name       = var.producer
  #   private_zone_name   = data.terraform_remote_state.host-infra.outputs.avayacloud_com_env_dns_private_zone_name
  #   private_zone_domain = data.terraform_remote_state.host-infra.outputs.avayacloud_com_env_dns_private_zone_domain
  #   dns_project_id      = data.terraform_remote_state.host-infra.outputs.host_infra_project_id
  #   psql_default_pwd    = data.terraform_remote_state.projects.outputs.secret_passwords[var.psql_default_pwd]

  #   redis          = var.redis_config
  #   redis_ip_range = var.redis_ip_range

  #   mongodb           = var.mongodb_config
  #   mongodb_admin_pwd = data.terraform_remote_state.projects.outputs.secret_passwords[var.mongodb_admin_pwd]

  #   filestore_cidr           = var.filestore_cidr
  #   filestore_instance_name  = var.filestore_instance_name
  #   filestore_fileshare_size = var.filestore_fileshare_size
  #   filestore_fileshare_name = var.filestore_fileshare_name
  #   filestore_ip_name        = var.filestore_ip_name
  #   network_id               = data.terraform_remote_state.host-infra.outputs.host_infra_network_id
  #   subnets_self_links       = data.terraform_remote_state.host-infra.outputs.host_infra_subnets_self_link[0]
  #   #sa_members                    = var.sa_members

  #   #bastion_linux_image_name   = var.bastion_linux_image_name
  #   #bastion_windows_image_name = var.bastion_windows_image_name
  #   #bastion_linux_name         = var.bastion_linux_name
  #   #bastion_windows_name       = var.bastion_windows_name
  #   #bastion_disk_type          = var.bastion_disk_type
  #   #bastion_disk_size_gb       = var.bastion_disk_size_gb
  #   #bastion_tags               = var.bastion_tags
  #   #windows_bastion_ports      = var.windows_bastion_ports
  #   #bastion_image_project      = var.bastion_image_project

  #   #pd_name                       = var.pd_name
  #   #pd_size                       = var.pd_size
  #   metadata = {
  #     enable-oslogin = "TRUE"
  #   }
}

# resource "google_project_iam_binding" "viewer" {
#   project = data.terraform_remote_state.projects.outputs.service_project_id
#   role    = "roles/viewer"
#   members = var.sa_members
# }
