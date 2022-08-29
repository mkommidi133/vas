output "customer_env_folder_ids" {
  value = local.env_folder_ids
}

output "customer_folder_id" {
  value = var.create_customer_folder ? google_folder.customer[0].id : ""
}

output "tf_execute_sa" {
  value = {
    for k, v in google_service_account.execute_sa : k => v.email
  }
  description = "Terraform Execute SAs"
}

output "tf_token_sa" {
  value = {
    for k, v in google_service_account.token_sa : k => v.email
  }
  description = "Terraform Token generator SAs"
}