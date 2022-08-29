locals {
  sa_account = "tf-master-exe@vas-offer-services-360018.iam.gserviceaccount.com"
  #  #hub_peering_ws = "ccaasle-${var.customer_name}-networks-hub"
  #  #hub_secrets    = merge(local.mongodb_secrets, local.master_sa_account)
  #  secrets        = merge(local.mongodb_secrets, local.env_sa_account)
  secrets        = local.env_sa_account
  tfc_workspaces = merge(var.main_workspace, var.tfc_workspaces)
  workspace = flatten([
    for current_workspace, current_ws in local.tfc_workspaces : [
      for remote_ws in current_ws.remote_workspace_consumer : {
        current_workspace = current_workspace
        remote_workspace  = remote_ws
      }
    ]
  ])

  folder_ids = {
    for k, v in google_folder.customer_env : k => trim(v.id, "folders/")
  }

  env_folder_ids = {
    folder_id = local.folder_ids
  }
  #
  common_vars = {
    environment_name = var.env
    customer_name    = var.customer_name
    offer_folder_id  = var.offer_folder_id
    billing_id       = var.billing_account_id
  }

  gcp_creds = google_service_account_key.token_sa_keys[var.env].private_key
  env_sa_account = {
    sa_account = google_service_account.execute_sa[var.env].email
  }
  #  master_sa_account = {
  #    sa_account = local.sa_account
  #  }
  #  mongodb_secrets = {
  #    mongodb_pub_key = var.mongodb_public_key
  #    mongodb_pvt_key = var.mongodb_private_key
  #  }
}