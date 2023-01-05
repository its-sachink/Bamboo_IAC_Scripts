resource "aws_iam_role" "testrole" {
  name = "role2"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          "AWS" = "*"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy" "testrolepolicy" {
  name = "aws_iam_role_policy_testrolepolicy"
  role = aws_iam_role.customrole.name
  # CKV_AWS_62 - Ensure IAM policies that allow full \"*-*\" administrative privileges are not created
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "*",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "testrolepolicy1" {
  name = "aws_iam_role_policy_testrolepolicy1"
  role = aws_iam_role.customrole.name
  # Ensure no IAM policies documents allow "*" as a statement's actions
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["*"]
        Effect   = "Allow"
        Resource = "arn:aws:s3:*:*:mybucket"
      },
    ]
  })
}

resource "aws_iam_role" "customrole" {
  name = "test-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}