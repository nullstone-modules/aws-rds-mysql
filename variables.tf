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
  description = <<EOF
The storage in GiB to reserve for the RDS instance.
If max_allocated_storage is enabled, this argument represents the initial storage allocation.
While auto-scaling is enabled, changes to allocated_storage are ignored.
EOF
}

variable "max_allocated_storage" {
  type        = number
  default     = 0
  description = <<EOF
This sets the maximum amount of storage in GiB that autoscaling will increase the RDS instance storage.
Auto-scaling is *only* enabled if max_allocated_storage > allocated_storage.
When enabled, allocated_storage is only used for setting the initial storage size.
EOF
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

variable "auto_upgrade_minor" {
  type        = bool
  default     = true
  description = <<EOF
Whether or not to automatically upgrade minor versions of the database.
These upgrades are performed during the maintenance window (See `maintenance_window` variable).
EOF
}

variable "maintenance_window" {
  type        = string
  default     = "Sat:03:00-Sat:03:30"
  description = <<EOF
A weekly time interval in which to performance maintenance (e.g. minor version upgrades, patches, etc.).
This window is configured using UTC time zone.
Syntax: "ddd:hh24:mi-ddd:hh24:mi"
Example: "Mon:00:00-Mon:03:00"
See [RDS Maintenance Window docs](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Maintenance.html#AdjustingTheMaintenanceWindow) for more information.
EOF
}

locals {
  port = 3306
}
