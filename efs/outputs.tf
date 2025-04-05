output "efs-mount-target-dns" {
  description = "Address of the mount target provisioned."
  value       = aws_efs_mount_target.main.0.dns_name
}

output "efs-id" {
  description = "Address of the mount target provisioned."
  value       = aws_efs_file_system.main.id
}

resource "aws_ssm_parameter" "efs_access_point_id" {
  count = length(var.efs_access_points)

  name  = var.efs_access_points[count.index].ssm_name
  type  = "String"
  value = aws_efs_access_point.main[count.index].id
}