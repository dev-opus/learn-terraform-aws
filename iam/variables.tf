variable "user_name" {
  description = "The name of the IAM user"
  type        = string
  default     = "bobby"
}

variable "group_name" {
  description = "The name of the IAM group"
  type        = string
  default     = "S3Maintainers"
}

variable "iam_path" {
  description = "The path for the IAM resources"
  type        = string
  default     = "/engineering/"
}

variable "policy_name" {
  description = "The name of the IAM policy"
  type        = string
  default     = "CustomS3ReadList"
}
