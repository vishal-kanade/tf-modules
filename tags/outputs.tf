output "asg_tags" {
  value       = local.asgtags
  description = "Tags as a list of maps for ASGs"
}

output "tags" {
  value = local.tags
}

