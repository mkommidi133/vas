variable "host_project_id" {}
variable "service_project_id" {}
variable "offer_name" {}
variable "environment_name" {}
variable "customer_abbr" {}
variable "primary_region" {}
variable "zones" {}
variable "gke_cluster" {}
variable "network_name" {}
variable "subnets_name" {}
variable "node_pools_labels" {
  description = "Labels for node pools"
  type        = map(map(string))
  default = {
    all               = {}
    default-node-pool = {}
  }
}

variable "node_pools_metadata" {
  description = "Metadata for node pools"
  type        = map(map(string))
  default = {
    all               = {}
    default-node-pool = {}
  }
}

variable "node_pools_tags" {
  description = "Network tags for node pools"
  type        = map(list(string))
  default = {
    all               = []
    default-node-pool = []
  }
}

variable "node_pools_taints" {
  description = "Node taints for node pools"
  type        = map(list(object({ key = string, value = string, effect = string })))
  default = {
    all               = []
    default-node-pool = []
  }
}
 