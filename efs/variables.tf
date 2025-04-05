variable "subnets" {
  type        = list(string)
  description = "list of subnets to mount the fs to"
}

variable "vpc_id" {
  type        = string
  description = "id of the vpc where the subnets and the fs should live"
}

variable "tags" {
  type    = map(string)
  default = null
}

variable "default_name_prefix" {}

variable "transition_to_ia_period" {
  type        = string
  description = "No of days after which data to be transfered to IA class"
  default     = null
}

variable "transition_to_archive_period" {
  type        = string
  description = "No of days after which data to be transfered to Archive class"
  default     = null
}

variable "transition_to_primary_storage_class_period" {
  type        = string
  description = "No of days after which data to be transfered back to standard class"
  default     = null
}

variable "efs_access_points" {
  description = "EFS access point values"
  type = list(object({
    uid      = number
    gid      = number
    path     = string
    ssm_name = string
  }))
  default = []
}
