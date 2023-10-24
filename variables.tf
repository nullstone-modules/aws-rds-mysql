variable "mysql_version" {
  type        = string
  default     = "8.0"
  description = "Mysql Engine Version"
}

variable "instance_class" {
  type        = string
  default     = "db.t3.micro"
  description = <<EOF
Available Instance Types: https://aws.amazon.com/rds/instance-types/
T = Burstable (can utilize full CPU/memory for short periods of time)
M = General-Purpose
R/X/Z = Memory-Optimized
EOF
}

variable "allocated_storage" {
  type        = number
  default     = 10
  description = "Allocated storage in GB"
}

variable "backup_retention_period" {
  type        = number
  default     = 5
  description = "The number of days that each backup is retained"
}

variable "high_availability" {
  type        = bool
  default     = true
  description = <<EOF
Enables high availability and failover support on the database instance.
By default, this is enabled to ensure reliability.
In dev environments, it is best to turn off to save on costs.
EOF
}

locals {
  port = 3306
}
