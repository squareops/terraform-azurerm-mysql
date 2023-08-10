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


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.22 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mysql_flexible"></a> [mysql\_flexible](#module\_mysql\_flexible) | squareops/mysql/azurerm | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_vnet"></a> [create\_vnet](#input\_create\_vnet) | Set to 'true' to create a fresh VNet for the database server. | `bool` | `false` | no |
| <a name="input_diagnostics_enabled"></a> [diagnostics\_enabled](#input\_diagnostics\_enabled) | Enable diagnostics for logging and monitoring. | `bool` | `false` | no |

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
