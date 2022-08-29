output "host_infra_project_id" {
  value       = module.host_infra_project.project_id
  description = "Host Infra project ID"
}

output "host_infra_network_name" {
  value       = module.host_infra_network.network_name
  description = "Host Infra Network name"
}

output "host_infra_network_self_link" {
  value       = module.host_infra_network.network_self_link
  description = "Host Infra Network self links"
}

output "host_infra_network_id" {
  value       = module.host_infra_network.network_id
  description = "Host Infra Network id"
}


output "host_infra_subnets" {
  value       = module.host_infra_subnets.subnets
  description = "Host Infra Subnets name"
}

output "host_infra_subnets_self_link" {
  value       = [for k, v in module.host_infra_subnets.subnets : v.self_link]
  description = "Host Infra Subnet Self Links"
}

output "avayacloud_com_env_dns_private_zone_name" {
  value       = module.avayacloud_com_env_dns_private_zone.name
  description = "Private zone name"
}

output "avayacloud_com_env_dns_private_zone_domain" {
  value       = module.avayacloud_com_env_dns_private_zone.domain
  description = "Private zone domain"
}
