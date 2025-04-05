variable "name" {
  type        = string
  description = "Name of the Queue"
}

variable "delay_seconds" {
  type        = number
  description = "Delay Seconds for SQS"
  default     = 0
}

variable "max_message_size" {
  type        = number
  description = "Maximum message size for SQS"
  default     = 262144
}

variable "message_retention_seconds" {
  type        = number
  description = "Message Retention time in Seconds"
  default     = 14400
}

variable "receive_wait_time_seconds" {
  type        = number
  description = "Message Receive wait timeout time in Seconds"
  default     = 0
}

variable "visibility_timeout_seconds" {
  type = number
  description = "The visibility timeout for the queue"
  default = 30
}

variable "tags" {
  description = "The list of tags for resources"
  type        = map(string)
}

variable "policy" {
  default = null
  type = string
  description = "The JSON policy for the SQS queue"
}