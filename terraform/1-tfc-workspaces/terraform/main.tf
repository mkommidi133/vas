resource "google_folder" "customer" {
  count        = var.create_customer_folder ? 1 : 0
  display_name = var.customer_folder_name
  parent       = "folders/${var.offer_folder_id}"
}