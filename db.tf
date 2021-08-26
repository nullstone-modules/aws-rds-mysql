resource "aws_db_instance" "this" {
  identifier = local.resource_name

  db_subnet_group_name   = aws_db_subnet_group.this.name
  engine                 = "mysql"
  engine_version         = var.mysql_version
  instance_class         = var.instance_class
  multi_az               = true
  allocated_storage      = var.allocated_storage
  storage_encrypted      = true
  storage_type           = "standard"
  port                   = local.port
  vpc_security_group_ids = [aws_security_group.this.id]

  username = replace(data.ns_workspace.this.block_ref, "-", "_")
  password = random_password.this.result

  // final_snapshot_identifier is unique to when an instance is launched
  // This prevents repeated launch+destroy from creating the same final snapshot and erroring
  // Changes to the name are ignored so it doesn't keep invalidating the instance
  final_snapshot_identifier = "${local.resource_name}-${replace(timestamp(), ":", "-")}"

  backup_retention_period = var.backup_retention_period
  backup_window           = "02:00-03:00"

  tags = local.tags

  lifecycle {
    ignore_changes = [username, final_snapshot_identifier]
  }
}

resource "aws_db_subnet_group" "this" {
  name        = local.resource_name
  description = "Mysql db subnet group for mysql cluster"
  subnet_ids  = local.private_subnet_ids
  tags        = local.tags
}
