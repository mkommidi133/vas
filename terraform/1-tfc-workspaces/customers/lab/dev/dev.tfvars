tfc_organization    = "monisra"
customer_sa_account = "vas-avaya-lab" # 17 character max
customer_envs       = ["dev"]
customer_folder_id  = ""
#
#
create_sa                          = true
sa_project_id                      = "vas-offer-services-360018"
artifact_project                   = "vas-offer-services-360018"
create_customer_environment_folder = true
#
env           = "dev"
customer_name = "lab"
#offer_name     = "vas"
vcs_identifier = "mkommidi133/vas"
vcs_oauth      = "ot-65TX7oAfnNTJj9Ln"
working_branch = "" # This is to control which github branch code to be used. default to ${env}
#
#business_unit      = "services"
billing_account_id = "01746D-E6AB9A-761ACF"
#contact_name       = "monisha"
#customer_abbr      = "dv1"
#
tfc_workspaces = {
  vas-avaya-lab-hostinfra = {
    sensitive = {
      hcl = {
        terraform_variables   = {}
        environment_variables = {}
      }
      non-hcl = {
        terraform_variables = {
          org_id      = "455937971530"
          cost_center = ""
        }
        environment_variables = {}
      }
    }
    non-sensitive = {
      hcl = {
        terraform_variables = {
          infra_subnets = [
            {
              subnet_name   = "host-infra-subnet-us-east4-01"
              subnet_ip     = "10.200.0.0/22"
              subnet_region = "us-east4"
            },
            {
              subnet_name   = "host-infra-subnet-us-east4-02"
              subnet_ip     = "10.200.4.0/22"
              subnet_region = "us-east4"
            },
            {
              subnet_name   = "host-infra-subnet-us-east4-03"
              subnet_ip     = "10.200.8.0/22"
              subnet_region = "us-east4"
            },
            {
              subnet_name   = "host-infra-subnet-us-east4-04"
              subnet_ip     = "10.200.12.0/22"
              subnet_region = "us-east4"
          }]
          secondary_ranges = {
            host-infra-subnet-us-east4-01 = [ # This should be match the "apps_subnet_name" variable from this workspace
              {
                range_name    = "vas-gke-pods-sec-subnet"
                ip_cidr_range = "10.200.128.0/20"
              },
              {
                range_name    = "vas-gke-services-sec-subnet"
                ip_cidr_range = "10.200.144.0/20"
              }
            ]
          }

        }
        environment_variables = {}
      }
      non-hcl = {
        terraform_variables = {
          environment_name   = "dev"
          business_unit      = "services"
          billing_account_id = "01746D-E6AB9A-761ACF"
          contact_name       = "monisha"
          customer_abbr      = "dv1"
          offer_name         = "vas"
          customer_name      = "lab"
        }
        environment_variables = {}
      }
    }
    working_dir               = "terraform/2-host-infra"
    remote_workspace_consumer = ["vas-avaya-lab-projects", "vas-avaya-lab-appinfra"]
    source_workspace_trigger  = ""
  }
  #
  vas-avaya-lab-projects = {
    sensitive = {
      hcl = {
        terraform_variables   = {}
        environment_variables = {}
      }
      non-hcl = {
        terraform_variables = {
          org_id      = "455937971530"
          cost_center = ""
        }
        environment_variables = {}
      }
    }
    non-sensitive = {
      hcl = {
        terraform_variables = {
          secret_viewers = []
          generate_passwords = {
            vas_mongodb_admin_pwd = {
              labels = {
                app           = "vas"
                database      = "mongodb"
                customer_name = "vas-lab"
              }
            }
            vas_cbsp_psql_default_pwd = {
              labels = {
                customer_name     = "avaya-lab"
                database_instance = "vas-default"
                vault             = "main_vault"
                app               = "vas"
              }
            }
          }
        }
        environment_variables = {}
      }
      non-hcl = {
        terraform_variables = {
          environment_name   = "dev"
          business_unit      = "services"
          billing_account_id = "01746D-E6AB9A-761ACF"
          contact_name       = "monisha"
          customer_abbr      = "dv1"
          offer_name         = "vas"
          customer_name      = "lab"
        }
        environment_variables = {}
      }
    }
    working_dir               = "terraform/3-projects"
    remote_workspace_consumer = ["vas-avaya-lab-appinfra"]
    source_workspace_trigger  = "vas-avaya-lab-hostinfra"
  }

  vas-avaya-lab-appinfra = {
    sensitive = {
      hcl = {
        terraform_variables   = {}
        environment_variables = {}
      }
      non-hcl = {
        terraform_variables = {
          org_id      = ""
          cost_center = ""
        }
        environment_variables = {}
      }
    }
    non-sensitive = {
      hcl = {
        terraform_variables = {
          #bastion_tags          = ["bastion"]
          #windows_bastion_ports = ["3389"]
          #sa_members            = []
          #cloud_sql_config = {
          #  main_vault = {
          #    name_prefix              = "postgres-sql-01"
          #    server_type              = "db-custom-2-7680" # Recommended prod tier "db-custom-80-520000"
          #    database_version         = "POSTGRES_13"
          #    availability_type        = "REGIONAL"
          #    maintenance_day          = "6"      # 1-7 starting on Monday
          #    maintenance_hour         = "01"     # 0-23
          #    maintenance_update_track = "stable" # Get updates earlier (canary) or later (stable)
          #    backup_start_time        = "00:01"  # Local time i believe
          #    backup_retained_backups  = "7"      # Number of backups to be retained
          #    backup_retention_unit    = "COUNT"
          #    deletion_protection      = false # Needs to be true for prod
          #  }
          #}
          #mongodb_config = {
          #  org_id                    = "5ebc23d1af1d283ac99a6e9a"
          #  project                   = "vas1.1"
          #  cidr                      = "10.200.65.0/24"
          #  acl                       = ["10.200.0.0/16"]
          #  regions                   = ["US_EAST_4"]
          #  cluster_prefix            = "vas11"
          #  mongodb_version           = "5.0"
          #  disk_size                 = "100"
          #  node_count                = "3"
          #  read_node_count           = "0"
          #  analytics_node_count      = "0"
          #  instance_size_name        = "M20"
          #  min_instance_size_scaling = "M10"
          #  max_instance_size_scaling = "M40"
          #  db_user                   = "admin"
          #  region                    = "US_EAST_4"
          #}
          #redis_config = {
          #  persistent = {
          #    name_prefix        = "vas-persistent"
          #    tier               = "STANDARD_HA" # BASIC or STANDARD_HA
          #    memory_size        = "10"          # in GB
          #    version            = "REDIS_6_X"
          #    maintenance_day    = "SATURDAY"
          #    maintenance_hour   = "06" # 0-23
          #    maintenance_minute = "30" # 0-59
          #    labels = {
          #      app           = "vas"
          #      customer_name = "avaya-lab"
          #      env           = "dev"
          #      offer         = "vas"
          #      service       = "redis"
          #    }
          #  }
          #  non_persistent = {
          #    name_prefix        = "vas-non-persistent"
          #    tier               = "BASIC" # BASIC or STANDARD_HA
          #    memory_size        = "5"     # in GB
          #    version            = "REDIS_6_X"
          #    maintenance_day    = "SATURDAY"
          #    maintenance_hour   = "06" # 0-23
          #    maintenance_minute = "30" # 0-59
          #    labels = {
          #      app           = "vas"
          #      customer_name = "avaya-lab"
          #      env           = "dev"
          #      offer         = "vas"
          #      service       = "redis"
          #    }
          #  }
          #}
          #gke_cluster_config = {
          #  name_prefix       = "vas"
          #  master_cidr_block = "10.200.64.0/28"
          #  ip_range_pods     = "vas-gke-pods-sec-subnet"
          #  ip_range_services = "vas-gke-services-sec-subnet"
          #  maintenance_time  = "05:00" # in GMT
          #  release_channel   = "STABLE"
          #  # UNSPECIFIED, RAPID, REGULAR or STABLE. Regular is usually default option to get new features in reasonable time
          #  node_pools = {
          #    name               = "vas-gke-node-pool"
          #    machine_type       = "n2-standard-8"
          #    autoscaling        = true
          #    min_count          = 1
          #    max_count          = 6
          #    max_surge          = 2
          #    max_unavailable    = 0
          #    disk_size_gb       = 100
          #    disk_type          = "pd-standard"
          #    image_type         = "COS_CONTAINERD"
          #    auto_repair        = true
          #    auto_upgrade       = true
          #    preemptible        = false
          #    initial_node_count = 2
          #  }
          #  master_authorized_networks_config = [
          #    {
          #      cidr_block   = "10.200.0.0/16"
          #      display_name = "vas-gke-vpc"
          #    },
          #  ]
          #  labels = {
          #    app           = "vas"
          #    customer_name = "avaya-lab"
          #    env           = "dev"
          #    offer         = "vas"
          #    service       = "gke-cluster"
          #  }
          #}
        }
        environment_variables = {}
      }
      non-hcl = {
        terraform_variables = {
          #environment_name           = "dev"
          #business_unit              = "services"
          #billing_account_id         = "01FAB7-7E9E73-94559C"
          #contact_name               = "monisha"
          #customer_abbr              = "dv1"
          #offer_name                 = "vas"
          #customer_name              = "lab"
          #primary_region             = "us-east4"
          #producer                   = "avaya"
          #psql_default_pwd           = "vas_cbsp_psql_default_pwd"
          #mongodb_admin_pwd          = "vas_mongodb_admin_pwd"
          #psql_ip_range              = "10.200.32.0"
          #redis_ip_range             = "10.200.33.0"
          #bastion_linux_image_name   = "rhel85-avaya-cis1-base-20220510-0001"
          #bastion_windows_image_name = "win19-avaya-cis1-base-20220711-1810"
          #bastion_disk_size_gb       = "100"
          #bastion_disk_type          = "pd-balanced"
          #bastion_linux_name         = "jumphost-linux-01"
          #bastion_windows_name       = "jumphost-win-01"
          #bastion_image_project      = "ccaasfs-offer-services-d09c"
          #bastion_machine_type       = "n2-standard-2"
          #filestore_cidr             = "10.200.66.0"
          #filestore_instance_name    = "vas-filestore"
          #filestore_fileshare_size   = 1024
          #filestore_fileshare_name   = "file_share_1"
          #filestore_ip_name          = "vas-filestore-ip"
        }
        environment_variables = {}
      }
    }
    working_dir               = "terraform/4-app-infra"
    remote_workspace_consumer = []
    source_workspace_trigger  = "vas-avaya-lab-projects"
  }
}