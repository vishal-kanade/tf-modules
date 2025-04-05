variable "cluster_identifier" {
  type    = string
  default = null
}

variable "database_name" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "instance_class" {
  type = string
}

variable "master_username" {
  type    = string
  default = null
}

variable "master_password" {
  type    = string
  default = null
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "engine_mode" {
  type = string
}

variable "backup_retention_period" {
  type    = number
  default = null
}

variable "vpc_security_group_ids" {
  type    = list(string)
  default = null
}

variable "storage_encrypted" {
  type    = bool
  default = null
}

variable "db_subnet_group_name" {
  type    = string
  default = null
}

variable "db_cluster_parameter_group_name" {
  type    = string
  default = null
}

variable "db_family" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = null
}

variable "subnet_group_name" {
  type    = string
  default = ""
}

variable "subnet_ids" {
  type = list(string)
}

variable "subnet_tags" {
  type    = map(string)
  default = null
}

variable "subnet_group_description" {
  type    = string
  default = ""
}

variable "max_capacity" {
  type        = number
  default     = null
  description = "Maximum capacity for an Aurora DB cluster in serverless DB engine mode"
}

variable "min_capacity" {
  type        = number
  default     = null
  description = "Minimum capacity for an Aurora DB cluster in serverless DB engine mode"
}
