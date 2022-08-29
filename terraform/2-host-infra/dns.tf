module "avayacloud_com_env_dns_private_zone" {
  source = "terraform-google-modules/cloud-dns/google"

  project_id = module.host_infra_project.project_id
  type       = "private"
  name       = "${var.environment_name}-${var.offer_name}-avayacloud-com"
  domain     = "${var.environment_name}.${var.offer_name}.avayacloud.com."

  private_visibility_config_networks = [
  module.host_infra_network.network_self_link]
}