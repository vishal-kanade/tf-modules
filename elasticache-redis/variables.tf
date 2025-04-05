variable "cluster_id" {
  type        = string
  description = "The identifier for elaticache cluster"
}

variable "engine" {
  type        = string
  description = "Name of the cache engine to be used for this cache cluster. [memcached/redis]"
}

variable "node_type" {
  type        = string
  description = "The instance class to be used for this cache cluster."
}

variable "num_cache_nodes" {
  type        = number
  description = "The initial number of cache nodes that the cache cluster will have."
}

variable "parameter_group_name" {
  type        = string
  description = "The name of the parameter group to associate with this cache cluster."
  default     = null
}

variable "engine_version" {
  type        = string
  description = "Version number of the cache engine to be used."
}

variable "port" {
  type        = string
  description = "The port number on which each of the cache nodes will accept connections."
}

variable "security_group_ids" {
  type        = list(string)
  description = "VPC security groups associated with the cache cluster."
}

variable "subnet_group_name" {
  type        = string
  description = "subnet group name to be used for the cache cluster."
}

variable "subnet_ids" {
  type = list(string)
  description = "List of VPC Subnet IDs for the cache subnet group"
}

variable "tags" {
  type = map(string)
}