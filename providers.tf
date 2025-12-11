
# terraform {
#   backend "remote" {
#     organization = "terraclouddec11"
#     workspaces {
#       name = "test"
#     }
#   }
# }



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
