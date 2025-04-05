output "collection_arn" {
  description = "Amazon Resource Name (ARN) of the collection."
  value       = aws_opensearchserverless_collection.this.arn
}

output "collection_id" {
  description = "Unique identifier for the collection."
  value       = aws_opensearchserverless_collection.this.id
}

output "collection_endpoint" {
  description = "Collection-specific endpoint used to submit index, search, and data upload requests to an OpenSearch Serverless collection."
  value       = aws_opensearchserverless_collection.this.collection_endpoint
}
