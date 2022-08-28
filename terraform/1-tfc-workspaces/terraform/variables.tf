variable "artifact_project" {
  description = "Artifacts Project id"
  type        = string
}

variable "billing_account_id" {
  description = "Billing Account id"
  type        = string
}

variable "create_customer_folder" {
  description = "To create customer folder under offer"
  type        = bool
  default     = false
}

variable "create_customer_environment_folder" {
  description = "To create customer environment folder under customer folder"
  type        = bool
  default     = false
}

variable "create_sa" {
  description = "To create customer service accounts"
  type        = bool
  default     = false
}

variable "customer_envs" {
  description = "List of the Customer Environments"
  type        = list(string)
}

variable "customer_folder_name" {
  description = "Name of the Customer"
  type        = string
  default     = ""
}

variable "customer_folder_id" {
  description = "ID of the Customer folder"
  type        = string
  default     = ""
}

#variable "customer_name" {
#  description = "Name of the Customer"
#  type        = string
#}

variable "customer_sa_account" {
  description = "Name of the Customer SAs"
  type        = string
}

#variable "env" {
#  description = "Current Working Environment"
#  type        = string
#}

variable "main_workspace" {
  description = "Map of the main workspace"
  type        = any
  default     = {}
}

variable "master_sa_creds" {
  description = "Master Token SA Key"
  type        = any
  default     = {}
}

variable "mongodb_public_key" {
  description = "Mongodb Atlas public key"
  type        = string
  default     = ""
}

variable "mongodb_private_key" {
  description = "Mongodb Atlas private key"
  type        = string
  default     = ""
}

variable "offer_folder_id" {
  description = "CCaaS offer gcp folder id"
  type        = string
  default     = ""
}

variable "sa_project_id" {
  description = "Project id where sa to be created"
  type        = string
}

#variable "tfc_organization" {
#  description = "Name of the terraform cloud organization"
#  type        = string
#}

variable "tfc_workspaces" {
  description = "Map of the customer specific workspaces"
  type        = any
  default     = {}
}

variable "tfc_shared_workspaces" {
  description = "Map of the shared workspaces"
  type        = any
  default     = {}
}

#variable "vcs_identifier" {
#  description = "GitHub identifier"
#  type        = string
#}
#
#variable "vcs_oauth" {
#  description = "GitHub oauth"
#  type        = string
#}

#variable "working_branch" {
#  description = "GitHub Branch"
#  type        = string
#}