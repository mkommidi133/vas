resource "google_project_iam_member" "gke_service_account_binding" {
  project = var.host_project_id
  role    = "roles/compute.securityAdmin"
  member  = "serviceAccount:service-${data.google_project.service_project.number}@container-engine-robot.iam.gserviceaccount.com"
}

module "gke_cluster" {
  source = "terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster-update-variant"
  #   version = "20.0.0"

  project_id      = var.service_project_id
  name            = "${var.offer_name}-${var.environment_name}-${var.customer_abbr}-vas-gke"
  region          = var.primary_region
  zones           = var.zones
  release_channel = var.gke_cluster.release_channel
  # Networks
  network_project_id         = var.host_project_id
  network                    = var.network_name
  subnetwork                 = var.subnets_name
  ip_range_pods              = var.gke_cluster.ip_range_pods
  ip_range_services          = var.gke_cluster.ip_range_services
  master_ipv4_cidr_block     = var.gke_cluster.master_cidr_block
  master_authorized_networks = var.gke_cluster.master_authorized_networks_config
  # Node Pools
  node_pools = [var.gke_cluster.node_pools]
  #  node_pools = [
  #    merge(var.gke_cluster.node_pools, { service_account = var.service_account })
  #  ]
  # default_max_pods_per_node = var.default_max_pods_per_node
  node_pools_labels          = var.node_pools_labels
  node_pools_metadata        = var.node_pools_metadata
  node_pools_taints          = var.node_pools_taints
  node_pools_tags            = var.node_pools_tags
  http_load_balancing        = true
  network_policy             = true
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = false
  enable_private_endpoint    = false
  enable_private_nodes       = true
  istio                      = false
  cloudrun                   = false
  dns_cache                  = true
  create_service_account     = false
  remove_default_node_pool   = true
}
