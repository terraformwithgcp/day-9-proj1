# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "importbucket1himanshu"
resource "google_storage_bucket" "importbucket1" {
  default_event_based_hold    = false
  enable_object_retention     = false
  force_destroy               = false
  labels                      = {}
  location                    = "US"
  name                        = "importbucket1himanshu"
  project                     = "terracloudlabs91"
  public_access_prevention    = "enforced"
  requester_pays              = false
  rpo                         = "DEFAULT"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  hierarchical_namespace {
    enabled = false
  }
  soft_delete_policy {
    retention_duration_seconds = 604800
  }
}
