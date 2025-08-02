provider "aws" {
  region = "us-east-1"
}

# create group 
resource "aws_iam_group" "s3_maintainers" {
  name = "S3Maintainers"
  path = "/engineering/"
}

# create user
resource "aws_iam_user" "maintainer" {
  name = "bobby"
  path = "/engineering/"
}

# create policy
resource "aws_iam_policy" "custom_s3_read_list" {
  name = "CustomS3ReadList"
  path = "/engineering/"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:GetObject"
        Resource = "arn:aws:s3:::*/*"
      },
      {
        Effect   = "Allow"
        Action   = "s3:ListBucket"
        Resource = "arn:aws:s3:::*"
      }
    ]
  })
}

# attach policy to group
resource "aws_iam_group_policy_attachment" "custom_s3" {
  group      = aws_iam_group.s3_maintainers.name
  policy_arn = aws_iam_policy.custom_s3_read_list.arn
}

# attach user to group
resource "aws_iam_group_membership" "s3Maintainers_membership" {
  group = aws_iam_group.s3_maintainers.name
  users = [aws_iam_user.maintainer.name]
  name  = "s3Maintainers-membership"
}
