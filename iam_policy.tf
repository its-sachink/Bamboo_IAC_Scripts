resource "aws_iam_policy" "testpolicy" {
  name        = "testpolicy"
  path        = "/"
  description = "My test policy1"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_policy" "testpolicy1" {
  name        = "testpolicy1"
  path        = "/"
  description = "My test policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:s3:*:*:mybucket"
      },
    ]
  })
}
