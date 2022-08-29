module "workspaces" {
  source = "./modules/workspaces"
  for_each = {
    for workspace, name in var.tfc_workspaces : workspace => name
  }
  tfc_org                       = var.tfc_organization
  workspace_name                = "${each.key}-${var.env}"
  tf_sen_hcl_variables          = each.value.sensitive.hcl.terraform_variables
  tf_sen_non_hcl_variables      = merge(local.secrets, each.value.sensitive.non-hcl.terraform_variables)
  tf_non_sen_hcl_variables      = merge(local.env_folder_ids, each.value.non-sensitive.hcl.terraform_variables)
  tf_non_sen_non_hcl_variables  = merge(local.common_vars, each.value.non-sensitive.non-hcl.terraform_variables)
  env_sen_hcl_variables         = each.value.sensitive.hcl.environment_variables
  env_sen_non_hcl_variables     = each.value.sensitive.non-hcl.environment_variables
  env_non_sen_hcl_variables     = each.value.non-sensitive.hcl.environment_variables
  env_non_sen_non_hcl_variables = each.value.non-sensitive.non-hcl.environment_variables
  gcp_credentials               = local.gcp_creds

  vcs_identifier = var.vcs_identifier
  vcs_oauth      = var.vcs_oauth
  working_dir    = each.value.working_dir
  branch         = var.working_branch != "" ? each.value.working_branch : var.env
}

data "tfe_workspace" "workspace_id" {
  for_each     = local.tfc_workspaces
  name         = "${each.key}-${var.env}"
  organization = var.tfc_organization
  depends_on   = [module.workspaces]
}

resource "tfe_run_trigger" "vas-run-triggers" {
  for_each = {
    for workspace, name in local.tfc_workspaces : workspace => name
    if name.source_workspace_trigger != ""
  }
  workspace_id  = data.tfe_workspace.workspace_id[each.key].id
  sourceable_id = data.tfe_workspace.workspace_id[each.value.source_workspace_trigger].id
  depends_on    = [module.workspaces]
}

# Workaround to provide remote state access to workspaces
resource "null_resource" "update_workspace" {
  triggers = {
    always_run = "${timestamp()}"
  }
  count = length(local.workspace)
  provisioner "local-exec" {
    command     = <<-EOT
      chmod +x ${path.module}/../../../.github/scripts/tfc_api.sh
      ${path.module}/../../../.github/scripts/tfc_api.sh ${data.tfe_workspace.workspace_id[local.workspace[count.index].current_workspace].id} ${data.tfe_workspace.workspace_id[local.workspace[count.index].remote_workspace].id}
      EOT
    interpreter = ["bash", "-c"]
  }
  depends_on = [module.workspaces]
}
