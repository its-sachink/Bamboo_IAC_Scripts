resource "aws_iam_user" "user1" {
  name = "test-user"
}

resource "aws_iam_role" "role1" {
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

resource "aws_iam_group" "group1" {
  name = "test-group"
}

resource "aws_iam_policy" "policy1" {
  name        = "test-policy"
  description = "A test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "testattachment" {
  name = "iam-policy-to-iam-user"
  users      = [aws_iam_user.user1.name]
  roles      = [aws_iam_role.role1.name]
  groups     = [aws_iam_group.group1.name]
  policy_arn = aws_iam_policy.policy1.arn
}
