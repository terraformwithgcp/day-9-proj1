resource "google_compute_network" "net1" {
    name                    = "custom-network-here"
    auto_create_subnetworks = false
  
}
resource "google_storage_bucket" "bucket2" {
    name     = "importbucket1himanshuusestbuckethfhfhfhfh"
    location = "US"
    provider = google.acc2
}