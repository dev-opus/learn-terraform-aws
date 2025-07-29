variable "base_cidr_block" {
  description = "The base cidr block for the vpc"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "value"
  type = map(object({
    cidr = string
    az   = string
  }))
  default = {
    "0" = { cidr = "10.0.2.0/24", az = "us-east-1a" }
    "1" = { cidr = "10.0.4.0/24", az = "us-east-1b" }
  }
}

variable "private_subnets" {
  description = "value"
  type = map(object({
    cidr = string
    az   = string
  }))
  default = {
    "0" = { cidr = "10.0.6.0/24", az = "us-east-1a" }
    "1" = { cidr = "10.0.8.0/24", az = "us-east-1b" }
  }
}
