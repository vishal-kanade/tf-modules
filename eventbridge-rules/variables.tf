variable "eventrule_name" {
  description = "Name of the EventBridge rule"
  type        = string
}

variable "eventrule_description" {
  description = "Description of the EventBridge rule"
  type        = string
}

variable "eventrule_state" {
  description = "State of the EventBridge rule"
  type        = string
  default     = "ENABLED"  # Update with your desired default value
}

variable "event_pattern" {
  description = "Event pattern in JSON format"
  type        = string
}

variable "target_arn" {
  description = "ARN of the EventBridge target"
  type        = string
}

variable "tags" {
  description = "Custom tags which can be passed on to the AWS resources. They should be key value pairs having distinct keys"
  type        = map(string)
  default = {
  }
}