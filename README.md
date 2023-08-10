# Azure Database for MYSQL
![squareops_avatar]

[squareops_avatar]: https://squareops.com/wp-content/uploads/2022/12/squareops-logo.png

### [SquareOps Technologies](https://squareops.com/) Your DevOps Partner for Accelerating cloud journey.
<br>
Azure Database for MySQL is a fully managed relational database service provided by Microsoft Azure. It allows you to deploy, manage, and scale MySQL databases in the cloud without the overhead of server maintenance and management. This service is designed to handle demanding workloads, ensuring high availability, security, and performance for your MySQL-powered applications.

### Features

#### 1. **Managed Service**
Azure Database for MySQL takes care of routine database tasks such as backups, updates, patching, and monitoring. This allows you to focus on developing your applications rather than managing the underlying infrastructure.

#### 2. **High Availability**
The service provides built-in high availability with automatic failover. In the event of a server failure, your database will be automatically switched to a standby server to minimize downtime and ensure data integrity.

#### 3. **Scalability**
Scale your database up or down based on your application's needs without significant downtime. Azure Database for MySQL supports both vertical and horizontal scaling, allowing you to adjust compute and storage resources as required.

#### 4. **Security**
Security is a top priority. The service offers features such as data encryption at rest and in transit, firewall rules, virtual network integration, and support for Azure Active Directory authentication for enhanced access control.

#### 5. **Automatic Backups**
Azure Database for MySQL performs automatic backups of your data, allowing you to restore your database to a specific point in time if needed. You can configure retention periods and backup frequency according to your business requirements.

#### 6. **Geo-Replication**
Enable read replicas in different Azure regions to distribute read traffic and improve application performance. This also provides disaster recovery capabilities by promoting a replica to a primary server in case of a regional outage.

#### 7. **Advanced Monitoring and Insights**
Gain insights into the performance and health of your MySQL database through Azure Monitor. Metrics and logs help you identify and troubleshoot issues, optimize performance, and plan for future resource needs.

#### 8. **Global Reach**
Azure Database for MySQL is available in multiple Azure regions worldwide. This allows you to place your database near your users for reduced latency and compliance with data residency requirements.

#### 9. **Compatibility**
The service is designed to be compatible with MySQL, ensuring that your existing MySQL applications can seamlessly migrate to Azure Database for MySQL without major modifications.

#### 10. **Flexible Development**
Integrate Azure Database for MySQL with popular development tools, frameworks, and languages. This includes support for popular libraries and connectors, making it easy to build applications that connect to your managed MySQL instance.

## Usage Example
```hcl
module "mysql_flexible" {
  source                       = "squareops/mysql/azurerm"
  name                         = "mysql-flexible"
  environment                  = "prod"
  resource_group_name          = "mysql-flexible-rg" # Specify the name of the resource group to be created
  resource_group_location      = "eastus"         # Specify the region of the resource group to be created
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
  auto_grow_enabled            = true # Auto scale storage
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
  tags = { Name = SKAF, Department = Engineering}
}
```

Refer [examples](https://github.com/squareops/terraform-azurerm-mysql/tree/main/examples/complete) for more details

Required permissions to create resources from this module are mentioned [here](https://github.com/squareops/terraform-azurerm-mysql/tree/main/roles.md)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.22 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.22 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_log_analytics_workspace.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_monitor_diagnostic_setting.mysql_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_mysql_flexible_database.mysql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_database) | resource |
| [azurerm_mysql_flexible_server.mysql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server) | resource |
| [azurerm_mysql_flexible_server_configuration.mysql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server_configuration) | resource |
| [azurerm_mysql_flexible_server_firewall_rule.mysql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server_firewall_rule) | resource |
| [azurerm_private_dns_zone.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_resource_group.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_user_assigned_identity.mysql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_virtual_network.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_monitor_diagnostic_categories.mysql_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_password"></a> [administrator\_password](#input\_administrator\_password) | Administrator password for the MySQL server. | `string` | `""` | no |
| <a name="input_administrator_username"></a> [administrator\_username](#input\_administrator\_username) | Administrator username for the MySQL server. | `string` | `""` | no |
| <a name="input_auto_grow_enabled"></a> [auto\_grow\_enabled](#input\_auto\_grow\_enabled) | Enable auto grow for storage. | `bool` | `true` | no |
| <a name="input_backup_retention_days"></a> [backup\_retention\_days](#input\_backup\_retention\_days) | Number of days to retain backups. | `string` | `"30"` | no |
| <a name="input_create_vnet"></a> [create\_vnet](#input\_create\_vnet) | Set to 'true' to create a fresh VNet for the database server. | `bool` | `false` | no |
| <a name="input_db_charset"></a> [db\_charset](#input\_db\_charset) | Character set for the MySQL database. | `string` | `"utf8"` | no |
| <a name="input_db_collation"></a> [db\_collation](#input\_db\_collation) | Collation for the MySQL database. | `string` | `"utf8_unicode_ci"` | no |
| <a name="input_diagnostics_enabled"></a> [diagnostics\_enabled](#input\_diagnostics\_enabled) | Enable diagnostics for logging and monitoring. | `bool` | `false` | no |
| <a name="input_end_ip_address"></a> [end\_ip\_address](#input\_end\_ip\_address) | End IP address for the firewall rule. | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Enviornment tag of the pg server | `string` | `""` | no |
| <a name="input_geo_redundant_backup_enabled"></a> [geo\_redundant\_backup\_enabled](#input\_geo\_redundant\_backup\_enabled) | Enable geo-redundant backups. | `bool` | `true` | no |
| <a name="input_iops"></a> [iops](#input\_iops) | IOPS for storage. | `string` | `"5000"` | no |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource. | `string` | `"eastus"` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Maintenance window settings. | `map(any)` | <pre>{<br>  "day_of_week": 3,<br>  "start_hour": 3,<br>  "start_minute": 0<br>}</pre> | no |
| <a name="input_mysql_configurations"></a> [mysql\_configurations](#input\_mysql\_configurations) | n/a | `map(string)` | <pre>{<br>  "innodb_buffer_pool_size": "12884901888",<br>  "max_allowed_packet": "536870912",<br>  "table_definition_cache": "5000",<br>  "table_open_cache": "5000"<br>}</pre> | no |
| <a name="input_mysql_version"></a> [mysql\_version](#input\_mysql\_version) | Version of MySQL server. | `string` | `"8.0.21"` | no |
| <a name="input_name"></a> [name](#input\_name) | Prefix of the resource name. | `string` | `""` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Specify the region of the resource group to be created | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specify the name of the resource group to be created | `string` | `"pg-flexible"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | SKU name for the MySQL server. | `string` | `""` | no |
| <a name="input_start_ip_address"></a> [start\_ip\_address](#input\_start\_ip\_address) | Start IP address for the firewall rule. | `string` | `""` | no |
| <a name="input_storage_size_gb"></a> [storage\_size\_gb](#input\_storage\_size\_gb) | Storage size in GB for the MySQL server. | `string` | `"128"` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | New subnet will be created with 'Microsoft.Storage' service endpoint. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to associate with your network and subnets. | `map(string)` | <pre>{<br>  "tag1": "",<br>  "tag2": ""<br>}</pre> | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | VNet will be created with specified CIDR ranges. Do not specify while passing an existing VNet resource group, name, and ID. | `string` | `""` | no |
| <a name="input_vnet_id"></a> [vnet\_id](#input\_vnet\_id) | If VNet creation is set to false, specify the VNet ID here. | `string` | `""` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | If VNet creation is set to false, specify the VNet name here. | `string` | `""` | no |
| <a name="input_vnet_resource_group_name"></a> [vnet\_resource\_group\_name](#input\_vnet\_resource\_group\_name) | If VNet creation is set to false, specify the resource group name where the VNet is present. | `string` | `""` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Availability zones for the MySQL server. | `string` | `"2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_diagnostic_setting_name"></a> [diagnostic\_setting\_name](#output\_diagnostic\_setting\_name) | Name of the created Diagnostic Setting for the MySQL Flexible Server. |
| <a name="output_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#output\_log\_analytics\_workspace\_name) | Name of the created Log Analytics Workspace for diagnostics. |
| <a name="output_mysql_configuration_settings"></a> [mysql\_configuration\_settings](#output\_mysql\_configuration\_settings) | Configuration settings applied to the MySQL Flexible Server. |
| <a name="output_mysql_database_name"></a> [mysql\_database\_name](#output\_mysql\_database\_name) | Name of the created MySQL Database within the Flexible Server. |
| <a name="output_mysql_firewall_rule_name"></a> [mysql\_firewall\_rule\_name](#output\_mysql\_firewall\_rule\_name) | Name of the created Firewall Rule for the MySQL Flexible Server. |
| <a name="output_mysql_server_name"></a> [mysql\_server\_name](#output\_mysql\_server\_name) | Name of the created Azure MySQL Flexible Server. |
| <a name="output_private_dns_zone_name"></a> [private\_dns\_zone\_name](#output\_private\_dns\_zone\_name) | Name of the created Private DNS Zone. |
| <a name="output_private_dns_zone_virtual_network_link_name"></a> [private\_dns\_zone\_virtual\_network\_link\_name](#output\_private\_dns\_zone\_virtual\_network\_link\_name) | Name of the created Private DNS Zone Virtual Network Link. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Name of the created Azure Resource Group. |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | Name of the created Azure Subnet. |
| <a name="output_user_assigned_identity_name"></a> [user\_assigned\_identity\_name](#output\_user\_assigned\_identity\_name) | Name of the created User Assigned Identity. |
| <a name="output_virtual_network_name"></a> [virtual\_network\_name](#output\_virtual\_network\_name) | Name of the created Azure Virtual Network, if applicable. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contribute & Issue Report

To report an issue with a project:

  1. Check the repository's [issue tracker](https://github.com/squareops/terraform-azurerm-mysql/issues) on GitHub
  2. Search to check if the issue has already been reported
  3. If you can't find an answer to your question in the documentation or issue tracker, you can ask a question by creating a new issue. Make sure to provide enough context and details.

## License

Apache License, Version 2.0, January 2004 (https://www.apache.org/licenses/LICENSE-2.0)

## Support Us

To support our GitHub project by liking it, you can follow these steps:

  1. Visit the repository: Navigate to the [GitHub repository]()

  2. Click the "Star" button: On the repository page, you'll see a "Star" button in the upper right corner. Clicking on it will star the repository, indicating your support for the project.

  3. Optionally, you can also leave a comment on the repository or open an issue to give feedback or suggest changes.

Staring a repository on GitHub is a simple way to show your support and appreciation for the project. It also helps to increase the visibility of the project and make it more discoverable to others.

## Who we are

We believe that the key to success in the digital age is the ability to deliver value quickly and reliably. That’s why we offer a comprehensive range of DevOps & Cloud services designed to help your organization optimize its systems & Processes for speed and agility.

  1. We are an AWS Advanced consulting partner which reflects our deep expertise in AWS Cloud and helping 100+ clients over the last 5 years.
  2. Expertise in Kubernetes and overall container solution helps companies expedite their journey by 10X.
  3. Infrastructure Automation is a key component to the success of our Clients and our Expertise helps deliver the same in the shortest time.
  4. DevSecOps as a service to implement security within the overall DevOps process and helping companies deploy securely and at speed.
  5. Platform engineering which supports scalable,Cost efficient infrastructure that supports rapid development, testing, and deployment.
  6. 24*7 SRE service to help you Monitor the state of your infrastructure and eradicate any issue within the SLA.

We provide [support](https://squareops.com/contact-us/) on all of our projects, no matter how small or large they may be.

To find more information about our company, visit [squareops.com](https://squareops.com/), follow us on [Linkedin](https://www.linkedin.com/company/squareops-technologies-pvt-ltd/), or fill out a [job application](https://squareops.com/careers/). If you have any questions or would like assistance with your cloud strategy and implementation, please don't hesitate to [contact us](https://squareops.com/contact-us/).