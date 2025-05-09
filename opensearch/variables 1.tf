######
# OpenSearch Collection
######
variable "name" {
  description = "Name of the collection."
  type        = string
}

variable "description" {
  description = "Description of the collection."
  type        = string
  default     = null
}

variable "use_standby_replicas" {
  description = "Indicates whether standby replicas should be used for a collection."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to the collection. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type        = map(string)
  default     = {}
}

variable "type" {
  description = "Type of collection. One of SEARCH, TIMESERIES, or VECTORSEARCH. Defaults to TIMESERIES."
  type        = string
  default     = "TIMESERIES"
  validation {
    error_message = "Please use a valid type!"
    condition     = contains(["SEARCH", "TIMESERIES", "VECTORSEARCH"], var.type)
  }
}

######
# Encryption Policy
######
variable "create_encryption_policy" {
  description = "Controls if encryption policy should be created."
  type        = bool
  default     = true
}

variable "encryption_policy_name" {
  description = "The name of the encryption policy."
  type        = string
  default     = null
}

variable "encryption_policy_description" {
  description = "Description of the encryption policy."
  type        = string
  default     = null
}

variable "encryption_policy_kms_key_arn" {
  description = "MS Customer managed key arn to use in the encryption policy."
  type        = string
  default     = null
}

######
# Network Policy
######
variable "create_network_policy" {
  description = "Controls if network policy should be created."
  type        = bool
  default     = true
}

variable "network_policy_name" {
  description = "The name of the network policy."
  type        = string
  default     = null
}

variable "network_policy_description" {
  description = "Description of the network policy."
  type        = string
  default     = null
}

variable "network_policy_type" {
  description = "Type of Network Policy. Supported Values are: AllPublic, AllPrivate, PublicCollectionPrivateDashboard, PrivateCollectionPublicDashboard"
  type        = string
  default     = "AllPublic"
  validation {
    error_message = "Please use a valid type!"
    condition     = contains(["AllPublic", "AllPrivate", "PublicCollectionPrivateDashboard", "PrivateCollectionPublicDashboard"], var.network_policy_type)
  }
}

######
# VPCE
######
variable "vpce_name" {
  description = "Name of the interface endpoint."
  type        = string
  default     = null
}

variable "vpce_subnet_ids" {
  description = "One or more subnet IDs from which you'll access OpenSearch Serverless. Up to 6 subnets can be provided."
  type        = list(string)
  default     = []
}

variable "vpce_vpc_id" {
  description = "ID of the VPC from which you'll access OpenSearch Serverless."
  type        = string
  default     = null
}

variable "vpce_security_group_ids" {
  description = "One or more security groups that define the ports, protocols, and sources for inbound traffic that you are authorizing into your endpoint. Up to 5 security groups can be provided."
  type        = list(string)
  default     = null
}

######
# VPCE Security Group
######
variable "vpce_create_security_group" {
  description = "Creates a security group for VPCE."
  type        = bool
  default     = true
}

variable "vpce_security_group_name" {
  description = "Security Group name for VPCE."
  type        = string
  default     = null
}

variable "vpce_security_group_description" {
  description = "Security Group description for VPCE."
  type        = string
  default     = null
}

variable "vpce_security_group_sources" {
  description = "Sources for inbound traffic to Opensearch Serverless"
  type = list(object({
    type    = string
    sources = list(string)
  }))
  default = []
}

######
# Data Access Policy
######
variable "create_access_policy" {
  description = "Controls if data access policy should be created."
  type        = bool
  default     = true
}

variable "access_policy_name" {
  description = "The name of the data access policy."
  type        = string
  default     = null
}

variable "access_policy_description" {
  description = "Description of the access policy."
  type        = string
  default     = null
}

variable "access_policy_rules" {
  description = "Rules to apply on access policy."
  type = list(object({
    type        = string
    permissions = list(string)
    principals  = list(string)
    indexes     = optional(list(string), [])
  }))
  default = []
}

######
# Data Lifecycle Policy
######
variable "create_data_lifecycle_policy" {
  description = "Controls if data lifecycle policy should be created."
  type        = bool
  default     = false
}

variable "data_lifecycle_policy_name" {
  description = "The name of the data lifecycle policy."
  type        = string
  default     = null
}

variable "data_lifecycle_policy_description" {
  description = "Description of the data lifecycle policy."
  type        = string
  default     = null
}

variable "data_lifecycle_policy_rules" {
  description = "Rules to apply on data lifecycle policy."
  type = list(object({
    indexes   = list(string)
    retention = optional(string, "Unlimited")
  }))
  default = []
}

######
# Security Config
######
variable "create_security_config" {
  description = "Controls if security config should be created."
  type        = bool
  default     = false
}

variable "security_config_name" {
  description = "The name of the security config."
  type        = string
  default     = null
}

variable "security_config_description" {
  description = "Description of the security config."
  type        = string
  default     = null
}

variable "saml_metadata" {
  description = "The XML IdP metadata file generated from your identity provider. Needs to be path to a file."
  type        = string
  default     = null
}

variable "saml_group_attribute" {
  description = "Specify an attribute for group to map user groups or roles from your assertion."
  type        = string
  default     = null
}

variable "saml_user_attribute" {
  description = "Specify a custom attribute for user ID if your assertion does not use NameID as the default attribute."
  type        = string
  default     = null
}

variable "saml_session_timeout" {
  description = "Session timeout, in minutes. Minimum is 5 minutes and maximum is 720 minutes (12 hours). Default is 60 minutes."
  type        = number
  default     = 60
}