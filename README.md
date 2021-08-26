# aws-rds-mysql

Nullstone Block standing up AWS RDS Mysql

## Inputs

- `mysql_version: string` - Mysql Engine Version - default: 8
- `instance_class: string` - Mysql Instance Class - default: db.t3.micro
- `allocated_storage: number` - Allocated storage in GB - default: 10
- `backup_retention_period: number` - The days to retain backups - default: 5

## Outputs

- `db_instance_arn: string` - Mysql Instance ARN
- `db_master_secret_id: string` - ID of AWS Secrets Manager Secret that holds database master credentials
- `db_endpoint: string` - Mysql Connection Endpoint
- `db_security_group_id: string` - Security Group ID for RDS Cluster
- `db_user_security_group_id: string` - Security Group ID - Attach to any instance to gain access to the mysql cluster
