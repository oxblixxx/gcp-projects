#https://registry.terraform.io/modules/terraform-google-modules/network/google/6.0.0
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
        }
     ]
}
