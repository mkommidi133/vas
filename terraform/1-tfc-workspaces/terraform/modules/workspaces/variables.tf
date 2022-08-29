variable "branch" {
  description = "Name of the working repo branch"
  type        = string
}

variable "env_sen_hcl_variables" {
  description = "TFC environment sensitive HCL variables"
  type        = map(string)
}

variable "env_sen_non_hcl_variables" {
  description = "TFC environment sensitive Non-HCL variables"
  type        = any
}

variable "env_non_sen_hcl_variables" {
  description = "TFC environment non-sensitive HCL variables"
  type        = any
}

variable "env_non_sen_non_hcl_variables" {
  description = "TFC environment non-sensitive Non-HCL variables"
  type        = any
}

variable "gcp_credentials" {
  description = "SA account token"
  type        = string
}

variable "tfc_org" {
  description = "Name of the terraform cloud organization"
  type        = string
}

variable "tf_sen_hcl_variables" {
  description = "TFC terraform sensitive HCL variables"
  type        = any
}

variable "tf_sen_non_hcl_variables" {
  description = "TFC terraform sensitive Non-HCL variables"
  type        = any
}

variable "tf_non_sen_hcl_variables" {
  description = "TFC terraform non-sensitive HCL variables"
  type        = any
}

variable "tf_non_sen_non_hcl_variables" {
  description = "TFC terraform non-sensitive Non-HCL variables"
  type        = any
}

variable "vcs_identifier" {
  description = "Name of the vcs provider and repo"
  type        = string
}

variable "vcs_oauth" {
  description = "Auth token id for the vcs provider"
  type        = string
}

variable "vcs_file_trigger" {
  description = "To trigger workspace based on file changes"
  type        = bool
  default     = true
}

variable "workspace_name" {
  description = "Name of the workspaces"
  type        = string
}

variable "working_dir" {
  description = "Name of the working directory"
  type        = string
}