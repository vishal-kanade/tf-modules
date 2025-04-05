# Gathers information about the VPC
data "aws_vpc" "main" {
  id = var.vpc_id
}

# Creates a new empty file system in EFS.
resource "aws_efs_file_system" "main" {
  encrypted = true

  dynamic "lifecycle_policy" {
    for_each = (var.transition_to_ia_period != null || var.transition_to_archive_period != null || var.transition_to_primary_storage_class_period != null) ? [1] : []
    content {
      transition_to_ia                    = var.transition_to_ia_period
      transition_to_archive               = var.transition_to_archive_period
      transition_to_primary_storage_class = var.transition_to_primary_storage_class_period
    }
  }

  tags = var.tags
}

# Creates a mount target of EFS in a specified subnet
resource "aws_efs_mount_target" "main" {
  count = length(var.subnets)

  file_system_id = aws_efs_file_system.main.id
  subnet_id      = element(var.subnets, count.index)

  security_groups = [
    aws_security_group.efs.id,
  ]
}

# Allow both ingress and egress for port 2049 (NFS)
resource "aws_security_group" "efs" {
  name        = "${var.default_name_prefix}-efs-mnt"
  description = "Allows NFS traffic from instances within the VPC."
  vpc_id      = var.vpc_id

  ingress {
    from_port = 2049
    to_port   = 2049
    protocol  = "tcp"

    cidr_blocks = [
      data.aws_vpc.main.cidr_block,
    ]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      data.aws_vpc.main.cidr_block,
    ]
  }

  tags = var.tags
}

# Creates an access point for the EFS, conditionally
resource "aws_efs_access_point" "main" {
  count = length(var.efs_access_points)

  file_system_id = aws_efs_file_system.main.id

  posix_user {
    uid = var.efs_access_points[count.index].uid
    gid = var.efs_access_points[count.index].gid
  }

  root_directory {
    path = var.efs_access_points[count.index].path
    creation_info {
      owner_uid   = var.efs_access_points[count.index].uid
      owner_gid   = var.efs_access_points[count.index].gid
      permissions = "755"
    }
  }

  tags = var.tags
}