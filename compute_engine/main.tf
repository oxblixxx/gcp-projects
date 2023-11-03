provider "google" {
  zone = "us-east1-b"
  region = "us-east1"
}

module "instances" {
  source = "./modules/instances"
}

#module "storage" {
# source = "./modules/storage"
#}

module "vpc" {
 source = "./modules/vpc"
}

terraform {
  backend "local" {
    path = "terraform/state/terraform.tfstate"
    #bucket  = "tf-bucket-017138"
#    prefix  = "terraform/state"
  }
}
