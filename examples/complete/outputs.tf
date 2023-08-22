output "resource_group_name" {
  description = "Name of the created Azure Resource Group."
  value       = module.mysql_flexible.resource_group_name
}

output "user_assigned_identity_name" {
  description = "Name of the created User Assigned Identity."
  value       = module.mysql_flexible.user_assigned_identity_name
}

output "virtual_network_name" {
  description = "Name of the created Azure Virtual Network, if applicable."
  value       = var.create_vnet ? module.mysql_flexible.virtual_network_name : null
}

output "subnet_name" {
  description = "Name of the created Azure Subnet."
  value       = module.mysql_flexible.subnet_name
}

output "private_dns_zone_name" {
  description = "Name of the created Private DNS Zone."
  value       = module.mysql_flexible.private_dns_zone_name
}

output "private_dns_zone_virtual_network_link_name" {
  description = "Name of the created Private DNS Zone Virtual Network Link."
  value       = module.mysql_flexible.private_dns_zone_virtual_network_link_name
}

output "mysql_server_name" {
  description = "Name of the created Azure MySQL Flexible Server."
  value       = module.mysql_flexible.mysql_server_name
}

output "mysql_database_name" {
  description = "Name of the created MySQL Database within the Flexible Server."
  value       = module.mysql_flexible.mysql_database_name
}

output "mysql_firewall_rule_name" {
  description = "Name of the created Firewall Rule for the MySQL Flexible Server."
  value       = module.mysql_flexible.mysql_firewall_rule_name
}

output "mysql_configuration_settings" {
  description = "Configuration settings applied to the MySQL Flexible Server."
  value       = module.mysql_flexible.mysql_configuration_settings
}

output "log_analytics_workspace_name" {
  description = "Name of the created Log Analytics Workspace for diagnostics."
  value       = var.diagnostics_enabled ? module.mysql_flexible.log_analytics_workspace_name : null
}

output "diagnostic_setting_name" {
  description = "Name of the created Diagnostic Setting for the MySQL Flexible Server."
  value       = var.diagnostics_enabled ? module.mysql_flexible.diagnostic_setting_name : null
}
