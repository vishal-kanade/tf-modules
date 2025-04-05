output "endpoint" {
  value       = aws_db_instance.default.address
  description = "DNS Endpoint of the instance"
}
