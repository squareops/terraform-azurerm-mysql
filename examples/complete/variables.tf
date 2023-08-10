variable "create_vnet" {
  description = "Set to 'true' to create a fresh VNet for the database server."
  type        = bool
  default     = false
}

variable "diagnostics_enabled" {
  description = "Enable diagnostics for logging and monitoring."
  type        = bool
  default     = false
}