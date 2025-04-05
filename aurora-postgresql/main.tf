resource "aws_rds_cluster_parameter_group" "this" {
  name        = var.db_cluster_parameter_group_name
  family      = var.db_family
  description = "RDS default cluster parameter group"
}

resource "aws_db_subnet_group" "this" {
  name        = var.db_subnet_group_name
  subnet_ids  = var.subnet_ids
  description = var.subnet_group_description
  tags        = var.subnet_tags
}

resource "aws_rds_cluster" "aurora" {
  cluster_identifier               = var.cluster_identifier
  database_name                    = var.database_name
  master_username                  = var.master_username
  master_password                  = var.master_password
  engine                           = var.engine
  engine_mode                      = var.engine_mode
  engine_version                   = var.engine_version
  backup_retention_period          = var.backup_retention_period
  vpc_security_group_ids           = var.vpc_security_group_ids
  storage_encrypted                = var.storage_encrypted
  db_subnet_group_name             = aws_db_subnet_group.this.name
  db_cluster_parameter_group_name  = aws_rds_cluster_parameter_group.this.name
  db_instance_parameter_group_name = aws_rds_cluster_parameter_group.this.name
  allow_major_version_upgrade      = false
  skip_final_snapshot              = true

  serverlessv2_scaling_configuration {
    max_capacity = var.max_capacity
    min_capacity = var.min_capacity
  }
  tags = var.tags
}

resource "aws_db_parameter_group" "this" {
  name   = var.db_cluster_parameter_group_name
  family = var.db_family
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count                   = var.instance_count
  identifier              = "${var.cluster_identifier}-instance-${count.index}"
  cluster_identifier      = aws_rds_cluster.aurora.id
  instance_class          = var.instance_class
  engine                  = aws_rds_cluster.aurora.engine
  engine_version          = aws_rds_cluster.aurora.engine_version
  db_parameter_group_name = aws_db_parameter_group.this.name
  copy_tags_to_snapshot   = true
  tags                    = var.tags
}
