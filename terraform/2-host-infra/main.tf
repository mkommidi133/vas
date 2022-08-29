module "host_infra_project" {
  source                         = "terraform-google-modules/project-factory/google"
  version                        = "~> 11.3"
  name                           = "${var.offer_name}-${var.environment_name}-${var.customer_abbr}-host-infra"
  random_project_id              = true
  folder_id                      = data.terraform_remote_state.workspaces.outputs.customer_env_folder_ids.folder_id[var.environment_name]
  org_id                         = var.org_id
  billing_account                = var.billing_account_id
  labels                         = local.project_labels
  enable_shared_vpc_host_project = true
  activate_apis                  = local.host_apis
}

module "host_infra_network" {
  source  = "terraform-google-modules/network/google"
  version = "~> 4.1"

  project_id   = module.host_infra_project.project_id
  network_name = "${var.offer_name}-${var.environment_name}-${var.customer_abbr}-host-infra-network"
  routing_mode = "GLOBAL"

  subnets = []
}

module "host_infra_subnets" {
  source  = "terraform-google-modules/network/google//modules/subnets-beta"
  version = "~> 4.1"

  project_id   = module.host_infra_project.project_id
  network_name = module.host_infra_network.network_name

  subnets          = var.infra_subnets
  secondary_ranges = var.secondary_ranges
}

module "host_infra_cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 1.3"

  count = length(distinct(local.host_infra_subnets_regions))

  name    = "host-infra-cloud-router-${distinct(local.host_infra_subnets_regions)[count.index]}"
  region  = distinct(local.host_infra_subnets_regions)[count.index]
  network = module.host_infra_network.network_id
  project = module.host_infra_project.project_id

  nats = [{
    name = "host-infra-network-nat-${distinct(local.host_infra_subnets_regions)[count.index]}"
  }]
}