locals {
  sa_account = var.sa_account
  #   sa_account_email = data.terraform_remote_state.workspaces.outputs.tf_execute_sa[var.environment_name]
  subnet_name = [for k in data.terraform_remote_state.host-infra.outputs.host_infra_subnets : k.name]
}

