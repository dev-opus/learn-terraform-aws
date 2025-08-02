output "user_arn" {
  description = "The ARN of the IAM user"
  value       = aws_iam_user.maintainer.arn
}

output "group_arn" {
  description = "The ARN of the IAM group"
  value       = aws_iam_group.s3_maintainers.arn
}

output "policy_arn" {
  description = "The ARN of the IAM policy"
  value       = aws_iam_policy.custom_s3_read_list.arn
}
