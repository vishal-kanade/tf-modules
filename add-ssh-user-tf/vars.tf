variable "environment" {
  description = "Environment"
  type        = string
  default     = ""
}

variable "usernames" {
  description = "List of okta id to create key pairs for"
  type        = list(string)
  default     = [""]
}

variable "ssm_document_name" {
  description = "SSM Document name for adding SSH keys"
  type        = string
  default     = ""
}

variable "ec2_instance_id" {
  description = "EC2 Instance ID for which SSH public keys needs to be added to authorized_keys"
  type        = string
  default     = null
}

variable "create_ssm_association" {
  description = "Flag to control creation of SSM association"
  type        = bool
  default     = false
}