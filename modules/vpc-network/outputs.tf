/******************************************
	VPC configuration
 *****************************************/

output "network" {
  value       = google_compute_network.network
  description = "The VPC resource being created"
}

output "network_name" {
  value       = google_compute_network.network.name
  description = "The name of the VPC being created"
}

output "network_id" {
  value       = google_compute_network.network.id
  description = "The ID of the VPC being created"
}

output "network_self_link" {
  value       = google_compute_network.network.self_link
  description = "The URI of the VPC being created"
}

# output "project_id" {
#   value       = var.shared_vpc_host && length(google_compute_shared_vpc_host_project.shared_vpc_host) > 0 ? google_compute_shared_vpc_host_project.shared_vpc_host[0].project : google_compute_network.network.project
#   description = "VPC project id"
# }


/******************************************
	           Subnets
 *****************************************/

output "subnets" {
  value       = google_compute_subnetwork.subnetwork
  description = "The created subnet resources"
}

/******************************************
	Routes
 *****************************************/

output "routes" {
  value       = google_compute_route.route
  description = "The created routes resources"
}

output "subnets_names" {
  value       = [for subnet in google_compute_subnetwork.subnetwork : subnet.name]
  description = "The names of the subnets being created"
}

output "subnets_ips" {
  value       = [for subnet in google_compute_subnetwork.subnetwork : subnet.ip_cidr_range]
  description = "The IP and CIDRs of the subnets being created"
}

output "subnets_regions" {
  value       = [for subnet in google_compute_subnetwork.subnetwork : subnet.region]
  description = "The regions where the subnets will be created"
}

output "subnets_private_access" {
  value       = [for subnet in google_compute_subnetwork.subnetwork : subnet.private_ip_google_access]
  description = "Whether the subnets have access to Google API's without a public IP"
}

output "subnets_flow_logs" {
  value       = [for subnet in google_compute_subnetwork.subnetwork : lookup(subnet.log_config[0], "enabled", null)]
  description = "Whether the subnets have VPC flow logs enabled"
}

output "subnets_secondary_ranges" {
  value       = [for subnet in google_compute_subnetwork.subnetwork : subnet.secondary_ip_range]
  description = "The secondary ranges associated with these subnets"
}

output "route_names" {
  value       = [for route in google_compute_route.route : route.name]
  description = "The names of the routes associated with the network"
}
