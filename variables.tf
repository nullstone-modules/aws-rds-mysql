variable "mysql_version" {
  type        = string
  default     = "8.0"
  description = "Mysql Engine Version"
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "allocated_storage" {
  type        = number
  default     = 10
  description = "Allocated storage in GB"
}

variable "backup_retention_period" {
  type    = number
  default = 5
}

locals {
  port = 3306
}