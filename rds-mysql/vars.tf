#-------- DB Instance --------

variable "db_name" {
  type        = string
  description = "Name of the database to be created on the RDS instance."
}

variable "engine" {
  type        = string
  description = "Name of the database engine to be used for this DB instance (e.g., mysql, postgres)."
}

variable "engine_version" {
  type        = string
  description = "Version of the database engine to be used for this DB instance."
}

variable "instance_class" {
  type        = string
  description = "Instance class to use for the DB instance (e.g., db.t3.micro, db.m5.large)."
}

variable "username" {
  type        = string
  default     = null
  description = "Username for the master DB user. This is required unless ManageMasterUserPassword is enabled."
}

variable "password" {
  type        = string
  default     = null
  description = "Password for the master DB user. This is required unless ManageMasterUserPassword is enabled."
}

variable "identifier_name" {
  type        = string
  description = "The unique identifier for the RDS DB instance."
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Whether to skip the creation of a final DB snapshot before the DB instance is deleted."
}

variable "storage_encrypted" {
  type        = bool
  description = "Specifies whether the DB instance is encrypted at rest."
}

variable "allocated_storage" {
  type        = number
  description = "The amount of storage (in gigabytes) to allocate for the DB instance."
}

variable "vpc_security_group_ids" {
  type        = list(string)
  default     = null
  description = "List of VPC security groups to associate with the DB instance."
}

variable "db_parameter_group_name" {
  type        = string
  description = "The name of the DB parameter group to associate with the DB instance."
}

variable "aws_db_option_group_name" {
  type        = string
  description = "The name of the DB option group to associate with the DB instance."
}

variable "backup_retention_period" {
  type        = number
  default     = null
  description = "The number of days to retain automated backups."
}

variable "allow_major_version_upgrade" {
  type    = bool
  default = true
}

variable "apply_immediately" {
  type    = bool
  default = true
}

variable "db_instance_tags" {
  type        = map(string)
  default     = null
  description = "A map of tags to assign to the DB instance."
}

#-------- Subnet Group --------

variable "db_subnet_group_name" {
  type        = string
  default     = ""
  description = "The name of the DB subnet group to associate with the DB instance."
}

variable "subnet_ids" {
  type        = list(string)
  description = "A list of VPC subnet IDs for the DB subnet group."
}

variable "subnet_group_description" {
  type        = string
  default     = ""
  description = "The description of the DB subnet group."
}

#-------- Option Group --------

variable "option_group_description" {
  type        = string
  description = "The description of the DB option group."
}

#-------- KMS Key --------

variable "kms_key_description" {
  type        = string
  description = "The description of the KMS key used for encryption."
}
