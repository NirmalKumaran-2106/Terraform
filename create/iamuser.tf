resource "aws_iam_user" "createiamuser" {
    name = "TerraformUser"
}
resource "aws_iam_group" "createiamgroup" {
    name = "Terraform-DevOps"
}
resource "aws_iam_group_policy" "iamgrouppolicy" {
    name = "Terraform-GroupPolicy"
    group = aws_iam_group.createiamgroup.name
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
resource "aws_iam_group_policy_attachment" "Policy-Attachment" {
    policy_arn = aws_iam_group_policy.iamgrouppolicy.arn   
    group = aws_iam_group.createiamgroup.name
}