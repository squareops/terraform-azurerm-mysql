locals {
  region      = "eastus"
  name        = "skaf-mysql"
  environment = "prod"
  additional_tags = {
    Owner      = "Organization_Name"
    Expires    = "Never"
    Department = "Engineering"
  }
}

module "mysql_flexible" {
  source                       = "squareops/mysql/azurerm"
  name                         = local.name
  environment                  = local.environment
  resource_group_name          = "mysql-flexible" # Specify the name of the resource group to be created
  resource_group_location      = local.region     # Specify the region of the resource group to be created
  create_vnet                  = "false"          # set "true" to create a fresh vnet for the database server.
  vnet_resource_group_name     = "demo-rg"        # If vnet creation is set to false, specify the resource group name where vnet is present.
  vnet_name                    = "vnet-test"      # If vnet creation is set to false, specify the vnet name here.
  vnet_id                      = ""               # If vnet creation is set to false, specify the vnet id here.
  vnet_address_space           = "10.10.0.0/16"   # vnet will be created with specified CIDR's. Do not specify while passing existing vnet resource group, name & id
  subnet_cidr                  = "10.20.3.0/28"   # New subnet will be created with "Microsoft.Storage" service endpoint.
  administrator_username       = "adminuser"
  administrator_password       = "Password@123"
  mysql_version                = "8.0.21"
  zones                        = "2"
  storage_size_gb              = "128"
  sku_name                     = "GP_Standard_D4ds_v4"
  backup_retention_days        = "30"
  iops                         = "5000"
  auto_grow_enabled            = true
  geo_redundant_backup_enabled = true
  db_collation                 = "utf8_unicode_ci"
  db_charset                   = "utf8"
  diagnostics_enabled          = "true" # For logging and monitoring
  start_ip_address             = "10.20.3.0"
  end_ip_address               = "10.20.3.255"
  maintenance_window = {
    day_of_week  = 3
    start_hour   = 3
    start_minute = 0
  }
  tags = local.additional_tags
}