data "aws_iam_policy_document" "testdoc" {
  statement {
    sid = ""
    actions   = ["sts:assumerole", "sts:getsessiontoken"]
    resources = ["arn:aws:iam:*:*:myuser"]
  }
}

data "aws_iam_policy_document" "testdoc1" {
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["s3:CreateBucket", "iam:UpdateLoginProfile"]
    #     iam:CreateAccessKey, iam:CreateLoginProfile, iam:UpdateLoginProfile, iam:AddUserToGroup, iam:CreatePolicyVersion, iam:AttachUserPolicy 
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "testdoc2" {
  statement {
    sid       = ""
    effect    = "Allow"
    actions   = ["ssm:GetParameter*", "s3:GetObject", "rds:CopyDBSnapshot"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "testdoc3" {
  statement {
    sid       = ""
    actions   = ["*"]
    resources = ["arn:aws:s3:*:*:mybucket"]
  }
}

resource "aws_iam_policy" "example_107" {
  name   = "example_107"
  path   = "/"
  policy = data.aws_iam_policy_document.testdoc.json
}

resource "aws_iam_policy" "example_109_110_111" {
  name   = "example__109_110_111"
  path   = "/"
  policy = data.aws_iam_policy_document.testdoc1.json
}
resource "aws_iam_policy" "example_108_111" {
  name   = "example_108_111"
  path   = "/"
  policy = data.aws_iam_policy_document.testdoc2.json
}

resource "aws_iam_policy" "example_49_107_110" {
  name   = "example_49_107_110"
  path   = "/"
  policy = data.aws_iam_policy_document.testdoc3.json
}