output "network_01_name" {
  value       = module.test-vpc-module-01.network_name
  description = "The name of the VPC network-01"
}

output "network_01_self_link" {
  value       = module.test-vpc-module-01.network_self_link
  description = "The URI of the VPC network-01"
}

output "network_01_subnets" {
  value       = module.test-vpc-module-01.subnets_names
  description = "The names of the subnets being created on network-01"
}

output "network_01_subnets_ips" {
  value       = module.test-vpc-module-01.subnets_ips
  description = "The IP and cidrs of the subnets being created on network-01"
}

output "network_01_subnets_regions" {
  value       = module.test-vpc-module-01.subnets_regions
  description = "The region where the subnets will be created on network-01"
}

output "network_01_subnets_private_access" {
  value       = module.test-vpc-module-01.subnets_private_access
  description = "Whether the subnets will have access to Google API's without a public IP on network-01"
}

output "network_01_subnets_flow_logs" {
  value       = module.test-vpc-module-01.subnets_flow_logs
  description = "Whether the subnets will have VPC flow logs enabled"
}

output "network_01_subnets_secondary_ranges" {
  value       = module.test-vpc-module-01.subnets_secondary_ranges
  description = "The secondary ranges associated with these subnets on network-01"
}

output "network_01_routes" {
  value       = module.test-vpc-module-01.route_names
  description = "The routes associated with network-01"
}