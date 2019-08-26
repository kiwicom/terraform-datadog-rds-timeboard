variable "database_identifier" {
  description = "Name of the instance"
}

variable "hostname" {
  description = "DNS record"
}

variable "create_dashboard" {
  description = "If set to false, do not create dashboard"
  default     = true
}
