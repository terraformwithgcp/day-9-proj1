provider "random" {
  
}

provider "google" {
    project = var.project-id
    region  = var.region
  
}
provider "google" {
    project = var.project-id
    region  = "us-east1"
    alias = "acc2"
  
}
