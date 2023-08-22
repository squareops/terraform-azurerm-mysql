output "resource_group_name" {
  description = "Name of the created Azure Resource Group."
  value       = azurerm_resource_group.default.name
}

output "user_assigned_identity_name" {
  description = "Name of the created User Assigned Identity."
  value       = azurerm_user_assigned_identity.mysql.name
}

output "virtual_network_name" {
  description = "Name of the created Azure Virtual Network, if applicable."
  value       = var.create_vnet ? azurerm_virtual_network.default[0].name : null
}

output "subnet_name" {
  description = "Name of the created Azure Subnet."
  value       = azurerm_subnet.default.name
}

output "private_dns_zone_name" {
  description = "Name of the created Private DNS Zone."
  value       = azurerm_private_dns_zone.default.name
}

output "private_dns_zone_virtual_network_link_name" {
  description = "Name of the created Private DNS Zone Virtual Network Link."
  value       = azurerm_private_dns_zone_virtual_network_link.default.name
}

output "mysql_server_name" {
  description = "Name of the created Azure MySQL Flexible Server."
  value       = azurerm_mysql_flexible_server.mysql.name
}

output "mysql_database_name" {
  description = "Name of the created MySQL Database within the Flexible Server."
  value       = azurerm_mysql_flexible_database.mysql.name
}

output "mysql_firewall_rule_name" {
  description = "Name of the created Firewall Rule for the MySQL Flexible Server."
  value       = azurerm_mysql_flexible_server_firewall_rule.mysql.name
}

output "mysql_configuration_settings" {
  description = "Configuration settings applied to the MySQL Flexible Server."
  value       = azurerm_mysql_flexible_server_configuration.mysql
}

output "log_analytics_workspace_name" {
  description = "Name of the created Log Analytics Workspace for diagnostics."
  value       = var.diagnostics_enabled ? azurerm_log_analytics_workspace.example[0].name : null
}

output "diagnostic_setting_name" {
  description = "Name of the created Diagnostic Setting for the MySQL Flexible Server."
  value       = var.diagnostics_enabled ? azurerm_monitor_diagnostic_setting.mysql_server[0].name : null
}
