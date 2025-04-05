# iff-aurora-postgresql

# AWS RDS Aurora Terraform Module

This module provisions an AWS RDS Aurora postgresql cluster.

## Usage

`module "aurora_postgresql" {
    source = "git::ssh://gitlab.com/danisco-nutrition-and-biosciences/iff-cloud-engineering/iff-terraform-core-modules/iff-aurora-postgresql.git"

    cluster_identifier      = "${var.environment}-${var.application}-${var.name}-cluster"
    database_name           = "${var.environment}${var.application}${var.name}db"
    master_username         = var.master_username
    master_password         = var.master_password
    engine                  = var.engine
    engine_mode             = var.engine_mode
    engine_version          = var.engine_version
    backup_retention_period = var.backup_retention_period
    vpc_security_group_ids  = var.vpc_security_group_ids
    storage_encrypted       = var.storage_encrypted
    instance_count          = var.instance_count
    instance_class          = var.instance_class
    tags                    = module.iff-tags.tags
    db_subnet_group_name = "${var.environment}-${var.application}-${var.name}-dbsubnetgroup"
    subnet_ids  = var.subnet_ids
    subnet_group_description = "${var.environment}-${var.application}-${var.name}-dbsubnetgroup"
    subnet_tags =module.iff-tags.tags
}
`

## Inputs

- `cluster_identifier`: The name of the RDS instance
- `database_name`: The name of the database to create when the DB instance is created
- `master_username`: The name of master user for the client DB instance.
- `master_password`: The password for the master user. 
- `engine`: The name of the database engine to be used for this DB instance.
- `engine_mode`: The database engine mode.
- `engine_version`: The version number of the database engine to use.
- `backup_retention_period`: The days to retain backups for.
- `vpc_security_group_ids`: List of VPC security groups to associate.
- `storage_encrypted`: Specifies whether the DB instance is encrypted.
- `db_subnet_group_name`: DB subnet group name to use for this instance.
- `skip_final_snapshot`: Determines whether a final DB snapshot is created before the DB instance is deleted.
- `tags`: A mapping of tags to assign to all resources.

## Outputs

- `cluster_id`: The ID of the RDS instance
- `cluster_arn`: The ARN of the RDS instance
- `cluster_endpoint`: The connection endpoint
- `cluster_reader_endpoint`: The reader endpoint for the RDS instance.
- `cluster_hosted_zone_id`: The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record).

## Authors

Module managed by IFF_DEVOPS.
