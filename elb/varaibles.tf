variable "vpc_id" {
  description = "The vpc id for the alb"
  type        = string
  default     = "vpc-08eedb58779b8f6a7"
}


variable "instance_sg_id" {
  description = "Security group ID for ec2 instances"
  type        = string
  default     = "sg-07c4b714cd87d540b"
}

variable "instance_names" {
  description = "Set of names for ec2 instances"
  type        = set(string)
  default     = ["instance-a", "instance-b"]
}

variable "ami" {
  description = "Amazon linux 2 ami image"
  type        = string
  default     = "ami-08a6efd148b1f7504" # amazon linux
}

variable "custom_page_rule_priority" {
  description = "Priority level for custom page listener rule"
  type        = number
  default     = 5
}
