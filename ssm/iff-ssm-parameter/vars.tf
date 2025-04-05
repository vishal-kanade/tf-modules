variable "name" {
  type    = string
  default = null
}

variable "description" {
  type    = string
  default = null
}

variable "type" {
  type    = string
  default = null
}

variable "value" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = null
}

variable "overwrite" {
  type    = bool
  default = true
}
