resource "google_storage_bucket" "tf-bucket-017138" {
  name          = "tf-bucket-017138"
  location      = "US"
  force_destroy = true
}
