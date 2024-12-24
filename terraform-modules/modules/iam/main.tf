resource "aws_iam_user" "dev_users" {
  for_each = toset(var.iam_user_name) # Iterate over the list of users

  name = each.value # Create user with the name from the list
}

resource "aws_iam_group" "dev" {
  for_each = toset(var.iam_group_name)
  name     = each.value
}

resource "aws_iam_policy" "ec2_policy-1" {
  name        = "ec2-policy"
  description = "Policy for EC2 to access S3 and CloudWatch"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:ListBucket", "s3:GetObject"]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = "cloudwatch:PutMetricData"
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "ec2_policy_attachment" {
  for_each = aws_iam_user.dev_users # Iterate over each user

  user       = each.value.name # Attach policy to each user
  policy_arn = aws_iam_policy.ec2_policy-1.arn
}

resource "aws_iam_role" "ec2_role" {
  name = "ec2-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}
