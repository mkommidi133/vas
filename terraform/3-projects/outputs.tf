output "service_project_id" {
  value       = module.service_project.project_id
  description = "Service project ID"
}

output "secret_project_id" {
  value       = module.secret_project.project_id
  description = "Secret project ID"
}

output "secret_passwords" {
  value       = { for k, v in random_password.generate_password : k => v.result }
  description = "Passwords"
  sensitive   = true
}
