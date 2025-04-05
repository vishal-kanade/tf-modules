resource "aws_kms_key" "rds" {
  description             = "RDS master key for ${var.identifier}"
  deletion_window_in_days = 30
  enable_key_rotation     = "true"
  tags                    = var.tags
}

resource "aws_kms_alias" "rds" {
  name          = "alias/${var.identifier}-rds-key"
  target_key_id = aws_kms_key.rds.key_id
}

resource "aws_db_parameter_group" "default" {
  name   = var.db_parameter_group_name
  family = var.family
}

resource "aws_db_subnet_group" "default" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids
  tags       = var.tags
}

resource "aws_db_instance" "default" {
  identifier                            = var.identifier
  db_name                               = var.database_name
  username                              = var.database_user
  password                              = var.database_password
  port                                  = var.database_port
  engine                                = var.engine
  engine_version                        = var.engine_version
  instance_class                        = var.instance_class
  allocated_storage                     = var.allocated_storage
  storage_encrypted                     = var.storage_encrypted
  vpc_security_group_ids                = var.vpc_security_group_ids
  db_subnet_group_name                  = aws_db_subnet_group.default.name
  parameter_group_name                  = aws_db_parameter_group.default.name
  license_model                         = var.license_model
  multi_az                              = var.multi_az
  storage_type                          = var.storage_type
  iops                                  = var.iops
  publicly_accessible                   = var.publicly_accessible
  allow_major_version_upgrade           = var.allow_major_version_upgrade
  auto_minor_version_upgrade            = var.auto_minor_version_upgrade
  kms_key_id                            = aws_kms_key.rds.arn
  apply_immediately                     = var.apply_immediately
  maintenance_window                    = var.maintenance_window
  skip_final_snapshot                   = var.skip_final_snapshot
  copy_tags_to_snapshot                 = var.copy_tags_to_snapshot
  backup_retention_period               = var.backup_retention_period
  backup_window                         = var.backup_window
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_retention_period = var.performance_insights_enabled ? var.performance_insights_retention_period : null
  performance_insights_kms_key_id       = var.performance_insights_enabled ? var.performance_insights_kms_key_id : null
  tags                                  = var.tags
  final_snapshot_identifier             = "${var.identifier}-final-snapshot"
}
