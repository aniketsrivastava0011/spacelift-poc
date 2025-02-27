locals {
  network_name_subnet_01 = "${var.network_name}-subnet-01"
  network_name_subnet_02 = "${var.network_name}-subnet-02-private"


  network_name_routes = [
    {
      name              = "${var.network_name}-egress-inet"
      description       = "route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      tags              = "egress-inet"
      next_hop_internet = "true"
    },
  ]
}

module "test-vpc-module-01" {
  source  = "../../modules/vpc-network"

  project_id   = var.project_id
  network_name = var.network_name

  subnets = [
    {
      subnet_name           = local.network_name_subnet_01
      subnet_ip             = "10.5.1.0/24"
      subnet_region         = "us-central1"
      subnet_private_access = "false"
      subnet_flow_logs      = "true"
    },
    {
      subnet_name           = local.network_name_subnet_02
      subnet_ip             = "10.5.3.0/24"
      subnet_region         = "us-central1"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    }
  ]

  routes = local.network_name_routes
}