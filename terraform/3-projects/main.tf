module "service_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 11.3"

  name                 = "${var.offer_name}-${var.environment_name}-${var.customer_abbr}-svc"
  random_project_id    = true
  folder_id            = data.terraform_remote_state.workspaces.outputs.customer_env_folder_ids.folder_id[var.environment_name]
  org_id               = var.org_id
  billing_account      = var.billing_id
  labels               = local.project_labels
  svpc_host_project_id = data.terraform_remote_state.host-infra.outputs.host_infra_project_id
  activate_apis        = local.service_apis
  shared_vpc_subnets   = data.terraform_remote_state.host-infra.outputs.host_infra_subnets_self_link
}