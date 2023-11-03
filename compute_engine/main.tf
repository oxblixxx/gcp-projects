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
