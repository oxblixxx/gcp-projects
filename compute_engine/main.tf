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


terraform {
  backend "local" {
    path = "terraform/state/terraform.tfstate"
    #bucket  = "tf-bucket-017138"
#    prefix  = "terraform/state"
  }
}

module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 6.0"

    project_id   = "qwiklabs-gcp-03-63e3ae316a5a"
    network_name = "tf-vpc-120295"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-east1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-east1"
          #  subnet_private_access = "true"
          #  subnet_flow_logs      = "true"
          #  description           = "This subnet has a description"
        }
     ]
}

resource "google_compute_firewall" "tf-firewall" {
  name    = "tf-firewall"
  network = "projects/qwiklabs-gcp-03-63e3ae316a5a/global/networks/tf-vpc-120295"


  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = ["web"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_network" "default" {
  name = "test-network"
}
