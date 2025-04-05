resource "aws_db_instance" "this" {
  allocated_storage           = var.allocated_storage
  db_name                     = var.db_name
  engine                      = var.engine
  engine_version              = var.engine_version
  instance_class              = var.instance_class
  username                    = var.username
  password                    = var.password
  db_subnet_group_name        = aws_db_subnet_group.this.id
  parameter_group_name        = var.db_parameter_group_name
  vpc_security_group_ids      = var.vpc_security_group_ids
  backup_retention_period     = var.backup_retention_period
  kms_key_id                  = aws_kms_key.this.arn
  identifier                  = var.identifier_name
  skip_final_snapshot         = var.skip_final_snapshot
  storage_encrypted           = var.storage_encrypted
  allow_major_version_upgrade = var.allow_major_version_upgrade
  apply_immediately           = var.apply_immediately
  tags                        = var.db_instance_tags
}

resource "aws_db_subnet_group" "this" {
  name        = var.db_subnet_group_name
  subnet_ids  = var.subnet_ids
  description = var.subnet_group_description
  tags        = var.db_instance_tags
}

resource "aws_db_parameter_group" "this" {
  name   = var.db_parameter_group_name
  family = data.aws_rds_engine_version.this.parameter_group_family
  tags   = var.db_instance_tags
}

resource "aws_db_option_group" "this" {
  name                     = var.aws_db_option_group_name
  option_group_description = var.option_group_description
  engine_name              = var.engine
  major_engine_version     = "${split(".", var.engine_version)[0]}.${split(".", var.engine_version)[1]}"
  tags                     = var.db_instance_tags
}

resource "aws_kms_key" "this" {
  description         = var.kms_key_description
  enable_key_rotation = true
}
