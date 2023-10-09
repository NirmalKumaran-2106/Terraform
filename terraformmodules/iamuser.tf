resource "aws_iam_user" "createiamuser" {
    name = "TerraformUser"
}
resource "aws_iam_group" "createiamgroup" {
    name = "Terraform-DevOps"
}
resource "aws_iam_user_group_membership" "group-membership" {
  user = aws_iam_user.createiamuser.name
  groups = [aws_iam_group.createiamgroup.name]
}
resource "aws_iam_policy" "iampolicy" {
    name = "Terraform-Policy"
    policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "ec2:*",
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "lambda:*",
            "Resource": "*"
        }]
    })
}
resource "aws_iam_role" "createrole" {
  name = "Terraform-Role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}
resource "aws_iam_policy_attachment" "Policy-Attachment" {
  name = "PolicyAttachment"
  policy_arn = aws_iam_policy.iampolicy.arn   
  users = [aws_iam_user.createiamuser.name]
  roles = [aws_iam_role.createrole.name]
}