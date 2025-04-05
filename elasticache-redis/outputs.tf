output "elasticache_subnet_group_name" {
  value = aws_elasticache_subnet_group.subnet_group.name
}

output "elasticache_endpoint" {
  value = aws_elasticache_cluster.elasticache_cluster.cache_nodes[0]["address"]
}