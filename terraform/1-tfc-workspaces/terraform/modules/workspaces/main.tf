resource "tfe_workspace" "vas" {
  name                  = var.workspace_name
  organization          = var.tfc_org
  working_directory     = var.working_dir
  file_triggers_enabled = var.vcs_file_trigger
  vcs_repo {
    identifier     = var.vcs_identifier
    oauth_token_id = var.vcs_oauth
    branch         = var.branch
  }
}

resource "tfe_variable" "vas-tf-sen-hcl-variables" {
  for_each     = var.tf_sen_hcl_variables
  category     = "terraform"
  key          = each.key
  value        = replace(jsonencode(each.value), "/(\".*?\"):/", "$1 = ")
  sensitive    = true
  hcl          = true
  workspace_id = tfe_workspace.vas.id
}

resource "tfe_variable" "vas-tf-sen-non-hcl-variables" {
  for_each     = var.tf_sen_non_hcl_variables
  category     = "terraform"
  key          = each.key
  value        = each.value
  sensitive    = true
  workspace_id = tfe_workspace.vas.id
}

resource "tfe_variable" "vas-tf-non-sen-hcl-variables" {
  for_each     = var.tf_non_sen_hcl_variables
  category     = "terraform"
  key          = each.key
  value        = replace(jsonencode(each.value), "/(\".*?\"):/", "$1 = ")
  sensitive    = false
  hcl          = true
  workspace_id = tfe_workspace.vas.id
}

resource "tfe_variable" "vas-tf-non-sen-non-hcl-variables" {
  for_each     = var.tf_non_sen_non_hcl_variables
  category     = "terraform"
  key          = each.key
  value        = each.value
  sensitive    = false
  workspace_id = tfe_workspace.vas.id
}

resource "tfe_variable" "vas-env-sen-hcl-variables" {
  for_each     = var.env_sen_hcl_variables
  category     = "env"
  key          = each.key
  value        = replace(jsonencode(each.value), "/(\".*?\"):/", "$1 = ")
  sensitive    = true
  hcl          = true
  workspace_id = tfe_workspace.vas.id
}

resource "tfe_variable" "vas-env-sen-non-hcl-variables" {
  for_each     = var.env_sen_non_hcl_variables
  category     = "env"
  key          = each.key
  value        = each.value
  sensitive    = true
  workspace_id = tfe_workspace.vas.id
}

resource "tfe_variable" "vas-env-non-sen-hcl-variables" {
  for_each     = var.env_non_sen_hcl_variables
  category     = "env"
  key          = each.key
  value        = replace(jsonencode(each.value), "/(\".*?\"):/", "$1 = ")
  sensitive    = false
  hcl          = true
  workspace_id = tfe_workspace.vas.id
}

resource "tfe_variable" "vas-env-non-sen-non-hcl-variables" {
  for_each     = var.env_non_sen_non_hcl_variables
  category     = "env"
  key          = each.key
  value        = each.value
  sensitive    = false
  workspace_id = tfe_workspace.vas.id
}

resource "tfe_variable" "gcp_creds" {
  category     = "env"
  key          = "GOOGLE_CREDENTIALS"
  value        = replace((base64decode(var.gcp_credentials)), "/\n/", " ")
  hcl          = true
  sensitive    = true
  workspace_id = tfe_workspace.vas.id
}
