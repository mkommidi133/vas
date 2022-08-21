#resource "google_compute_instance" "default" {
#  name         = "test"
#  machine_type = "e2-medium"
#  zone         = "us-central1-a"
#  tags         = ["foo", "bar"]
#  project      = "astral-root-360018"
#  boot_disk {
#    initialize_params {
#      image = "debian-cloud/debian-11"
#    }
#  }
# 
#  network_interface {
#    network = "default"
#
#    access_config {
#      // Ephemeral public IP
#    }
#  }
#  metadata = {
#    foo = "bar"
#  }
#  metadata_startup_script = "echo hi > /test.txt"
#}

resource "google_folder" "customer" {
  count        = var.create_customer_folder ? 1 : 0
  display_name = var.customer_folder_name
  parent       = "folders/${var.offer_folder_id}"
}