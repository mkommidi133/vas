variable "customer_name" {
  description = "Customer Name"
  type        = string
}

# variable "contact_name" {
#   description = "Contact name"
#   type        = string
# }

variable "customer_abbr" {
  description = "Abbreviated name of the Customer"
  type        = string
}

variable "environment_name" {
  description = "Name of the Environment"
  type        = string
}

# variable "cloud_sql_config" {
#   description = "Cloud SQL instances"
#   type        = any
# }

variable "sa_account" {
  description = "GCP SA with elevated permissions"
  type        = string
}

variable "primary_region" {
  description = "Primary region for instance"
  type        = string
}

# variable "producer" {
#   description = "App Producer Name"
#   type        = string
# }

variable "gke_cluster_config" {
  description = "GKE autopilot clusters"
  type        = any
}

# variable "sa_members" {
#   type        = list(string)
#   description = "List of IAM resources to allow access to the instance"
#   default     = []
# }

variable "offer_name" {
  description = "Name of the Offer"
  type        = string
}

# variable "psql_default_pwd" {
#   description = "Postgress default user password"
#   type        = string
# }

# variable "redis_config" {
#   description = "Redis Memorystore"
#   type        = any
# }

# variable "redis_ip_range" {
#   description = "Redis memory store ip range"
#   type        = string
# }

# variable "psql_ip_range" {
#   description = "Postgress ip range"
#   type        = string
# }

# variable "mongodb_pub_key" {
#   description = "Mongodb Atlas public key"
#   type        = string
# }

# variable "mongodb_pvt_key" {
#   description = "Mongodb Atlas private key"
#   type        = string
# }

# variable "mongodb_admin_pwd" {
#   description = "Mongodb admin credentials"
#   type        = string
# }

# variable "mongodb_config" {
#   description = "Mongodb cluster configs"
#   type        = any
# }

# #variable "bastion_windows_image_name" {
# #  description = "Windows Image name for Bastion Host"
# #  type        = string
# #}
# #
# #variable "bastion_linux_image_name" {
# #  description = "Linux Image name for Bastion Host"
# #  type        = string
# #}
# #
# #variable "bastion_linux_name" {
# #  description = "Name for Linux Bastion Host"
# #  type        = string
# #}
# #
# #variable "bastion_windows_name" {
# #  description = "Name for Windows Bastion Host"
# #  type        = string
# #}
# #
# #variable "bastion_disk_size_gb" {
# #  description = "Bastion VM disk size in GB"
# #  type        = string
# #}
# #
# #variable "bastion_disk_type" {
# #  description = "Bastion VM disk type"
# #  type        = string
# #}
# #
# #variable "bastion_tags" {
# #  description = "Bastion VM tags"
# #  type        = list(string)
# #}
# #
# #variable "windows_bastion_ports" {
# #  description = "A list of additional ports/ranges to open access for windows bastion"
# #  type        = list(string)
# #}
# #
# #variable "bastion_image_project" {
# #  description = "Project for bastion image"
# #  type        = string
# #}

# variable "filestore_cidr" {
#   type        = string
#   description = "Range of IP addresses for filestore subnet"
# }

# variable "filestore_instance_name" {
#   type        = string
#   description = "Name of the Instance of filestore"
# }

# variable "filestore_fileshare_size" {
#   type        = number
#   description = "Size for which file share need to created"
# }

# variable "filestore_fileshare_name" {
#   type        = string
#   description = "Name for which file share need to created"
# }

# variable "filestore_ip_name" {
#   type        = string
#   description = "Name for global address for filestore"
# }