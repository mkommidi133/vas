output "cluster_name" {
  value = module.gke_cluster.name
}

output "cluster_endpoint" {
  value     = module.gke_cluster.endpoint
  sensitive = true
}

output "cluster_certificate" {
  value     = module.gke_cluster.ca_certificate
  sensitive = true
}

# output "postgresql_private_ip" {
#   value = { for k, v in module.psql_master : k => v.instance_ip_address }
# }

# output "postgresql_connection_name" {
#   value = { for k, v in module.psql_master : k => v.instance_connection_name }
# }

# output "redis_id" {
#   value = { for k, v in google_redis_instance.redis_memorystore : k => v.id }
# }