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

module "firewall_rules" {
  source       = "../../modules/firewall"
  depends_on = [ module.test-vpc-module-01 ]
  project_id   = var.project_id
  # network_name = module.test-vpc-module-01.network_name
  network_name = var.network_name

  rules = [{
    name                    = "poc-firewall"
    description             = null
    direction               = "INGRESS"
    priority                = null
    # destination_ranges      = ["10.0.0.0/8"]
    source_ranges           = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = ["http-server", "https-server"]
    target_service_accounts = null
    allow = [
    {
      protocol = "tcp"
      ports    = ["80"]
    },
    {
      protocol = "tcp"
      ports    = ["443"]
    },
    {
      protocol = "tcp"
      ports    = ["22", "8080"]
    }
    ]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }]
}