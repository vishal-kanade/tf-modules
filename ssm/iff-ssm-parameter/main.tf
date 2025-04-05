resource "aws_ssm_parameter" "this" {
  name        = var.name
  description = var.description
  type        = var.type
  value       = var.value
  tags        = var.tags
  overwrite   = var.overwrite
}
