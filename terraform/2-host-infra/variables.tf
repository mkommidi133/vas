variable "billing_account_id" {
  description = "Billing Account id"
  type        = string
}

variable "business_unit" {
  description = "Business Unit"
  type        = string
}

variable "customer_name" {
  description = "Customer Name"
  type        = string
}

variable "contact_name" {
  description = "Contact name"
  type        = string
}

variable "cost_center" {
  description = "Cost Center"
  type        = string
}

variable "customer_abbr" {
  description = "Abbreviated name of the Customer"
  type        = string
}

variable "environment_name" {
  description = "Name of the Environment"
  type        = string
}

variable "infra_subnets" {
  description = "Customer infra Subnets"
  type        = list(map(string))
}

variable "offer_name" {
  description = "Name of the Offer"
  type        = string
}

variable "org_id" {
  description = "Organization ID"
  type        = string
}

variable "secondary_ranges" {
  description = "Subnet secondary ranges"
}

variable "sa_account" {
  description = "SA Account"
  type        = string
}