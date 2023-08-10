# Manages resource group
resource "azurerm_resource_group" "default" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# Manages a User Assigned Identity.
resource "azurerm_user_assigned_identity" "mysql" {
  depends_on          = [azurerm_resource_group.default]
  name                = format("%s-%s-%s", var.environment, var.name, "db-msi")
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  tags                = var.tags
}

# Manages a vnet
resource "azurerm_virtual_network" "default" {
  count               = var.create_vnet ? 1 : 0
  depends_on          = [azurerm_resource_group.default]
  name                = format("%s-%s-%s", var.environment, var.name, "vnet")
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  address_space       = [var.vnet_address_space]
  tags                = var.tags
}

# Manages a subnet
resource "azurerm_subnet" "default" {
  depends_on           = [azurerm_resource_group.default]
  name                 = format("%s-%s-%s", var.environment, var.name, "subnet")
  virtual_network_name = var.create_vnet == true ? azurerm_virtual_network.default[0].name : var.vnet_name
  resource_group_name  = var.create_vnet == true ? azurerm_resource_group.default.name : var.vnet_resource_group_name
  address_prefixes     = [var.subnet_cidr]
  service_endpoints    = ["Microsoft.Storage"]

  delegation {
    name = "mysql-flexible"

    service_delegation {
      name = "Microsoft.DBforMySQL/flexibleServers"

      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

# Manages private dns zone
resource "azurerm_private_dns_zone" "default" {
  depends_on          = [azurerm_resource_group.default, azurerm_subnet.default]
  name                = format("%s-%s%s", var.environment, var.name, ".mysql.database.azure.com")
  resource_group_name = var.create_vnet == true ? azurerm_resource_group.default.name : var.vnet_resource_group_name
  tags                = var.tags
}

# Manages private dns zone virtual network link
resource "azurerm_private_dns_zone_virtual_network_link" "default" {
  depends_on            = [azurerm_resource_group.default, azurerm_subnet.default]
  name                  = format("%s-%s-%s", var.environment, var.name, "pdzvnetlink.com")
  private_dns_zone_name = azurerm_private_dns_zone.default.name
  virtual_network_id    = var.create_vnet == true ? azurerm_virtual_network.default[0].id : var.vnet_id
  resource_group_name   = var.create_vnet == true ? azurerm_resource_group.default.name : var.vnet_resource_group_name
  tags                  = var.tags
}

# Manages a MySQL Flexible Server.
resource "azurerm_mysql_flexible_server" "mysql" {
  depends_on          = [azurerm_resource_group.default, azurerm_subnet.default]
  name                = format("%s-%s-%s", var.environment, var.name, "server")
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name

  delegated_subnet_id = azurerm_subnet.default.id
  private_dns_zone_id = azurerm_private_dns_zone.default.id

  administrator_login    = var.administrator_username
  administrator_password = var.administrator_password

  sku_name = var.sku_name
  version  = var.mysql_version

  dynamic "maintenance_window" {
    for_each = var.maintenance_window != null ? toset([var.maintenance_window]) : toset([])

    content {
      day_of_week  = lookup(maintenance_window.value, "day_of_week", 0)
      start_hour   = lookup(maintenance_window.value, "start_hour", 0)
      start_minute = lookup(maintenance_window.value, "start_minute", 0)
    }
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.mysql.id]
  }

  storage {
    auto_grow_enabled = var.auto_grow_enabled
    iops              = var.iops
    size_gb           = var.storage_size_gb
  }

  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  zone                         = var.zones

  tags = var.tags

  lifecycle {
    ignore_changes = [
      tags,
      zone
    ]
  }
}

# Manages a MySQL Database within a MySQL Flexible Server
resource "azurerm_mysql_flexible_database" "mysql" {
  depends_on          = [azurerm_mysql_flexible_server.mysql]
  server_name         = azurerm_mysql_flexible_server.mysql.name
  resource_group_name = azurerm_resource_group.default.name

  name      = format("%s-%s-%s", var.environment, var.name, "db")
  collation = var.db_collation
  charset   = var.db_charset
}

# Manages a Firewall Rule for a MySQL Flexible Server.
resource "azurerm_mysql_flexible_server_firewall_rule" "mysql" {
  depends_on          = [azurerm_mysql_flexible_server.mysql]
  server_name         = azurerm_mysql_flexible_server.mysql.name
  resource_group_name = azurerm_resource_group.default.name
  name                = format("%s-%s-%s", var.environment, var.name, "rules")
  start_ip_address    = var.start_ip_address
  end_ip_address      = var.end_ip_address
}

# Sets a MySQL Flexible Server Configuration value on a MySQL Flexible Server.
resource "azurerm_mysql_flexible_server_configuration" "mysql" {
  depends_on          = [azurerm_mysql_flexible_server.mysql]
  for_each            = var.mysql_configurations
  name                = each.key
  resource_group_name = azurerm_resource_group.default.name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  value               = each.value
}

data "azurerm_monitor_diagnostic_categories" "mysql_server" {
  depends_on  = [azurerm_mysql_flexible_server.mysql]
  count       = var.diagnostics_enabled ? 1 : 0
  resource_id = azurerm_mysql_flexible_server.mysql.id
}

resource "azurerm_log_analytics_workspace" "example" {
  depends_on          = [azurerm_mysql_flexible_server.mysql]
  count               = var.diagnostics_enabled ? 1 : 0
  name                = format("%s-%s-%s", var.environment, var.name, "workspace")
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_diagnostic_setting" "mysql_server" {
  count = var.diagnostics_enabled ? 1 : 0

  name                       = format("%s-%s-%s", var.environment, var.name, "mysql")
  target_resource_id         = azurerm_mysql_flexible_server.mysql.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example[0].id

  dynamic "log" {
    for_each = data.azurerm_monitor_diagnostic_categories.mysql_server[0].logs

    content {
      category = log.value
      enabled  = true

      retention_policy {
        enabled = true
        days    = 90
      }
    }
  }

  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.mysql_server[0].metrics

    content {
      category = metric.value
      enabled  = true

      retention_policy {
        enabled = true
        days    = 90
      }
    }
  }
}