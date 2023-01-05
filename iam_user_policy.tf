resource "aws_iam_user_policy" "testpolicy" {
  name = "test"
  # Ensure IAM policies are attached only to groups or roles
  user = aws_iam_user.lb.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        # Ensure IAM policies that allow full "*-*" administrative privileges are not created 
        Action   = "*"
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_user_policy" "testpolicy1" {
  name = "aws_iam_user_policy testpolicy"
  user = aws_iam_user.lb.name
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "*",
      "Resource": "arn:aws:s3:*:*:mybucket"
    }
  ]
}
EOF
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/app/"
}

resource "aws_iam_access_key" "lb" {
  user = aws_iam_user.lb.name
}