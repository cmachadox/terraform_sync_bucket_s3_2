resource "aws_iam_role" "role" {
  name = var.s3_sync_role

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "policy" {
  name        = var.s3_sync_policy
  description = "Police bucket S3"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [ 
            "arn:aws:s3:::${var.bucket_a}/*",
            "arn:aws:s3:::${var.bucket_b}/*"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach-role" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}