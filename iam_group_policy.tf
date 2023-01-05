resource "aws_iam_group_policy" "testgrp" {
  name  = "testgrp"
  group = aws_iam_group.developers.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Action" : "*",
        "Effect" : "Allow",
        "Resource" : "arn:aws:s3:*:*:mybucket"
      },
    ]
  })
}

resource "aws_iam_group_policy" "testgrp1" {
  name  = "testgrp1"
  group = aws_iam_group.developers.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Action" : "*",
        "Effect" : "Allow",
        "Resource" : "*"
      },
    ]
  })
}

resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/users/"
}
