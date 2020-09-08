# Policitca de acesso a usuários do grupo A

resource "aws_iam_group_policy" "policy_group_a" {
  name  = "policy_group_a"
  group = aws_iam_group.group_a.id

  policy = <<EOF
{
   "Version":"2012-10-17",
   "Statement":[
      {
         "Effect":"Allow",
         "Action": "s3:ListAllMyBuckets",
         "Resource":"arn:aws:s3:::*"
      },
      
      {
         "Effect":"Allow",
         "Action":[
            "s3:ListBucket",
            "s3:ListObjectsV2",
            "s3:PutObject",
            "s3:PutObjectAcl"
         ],
         "Resource":[
            "arn:aws:s3:::${var.bucket_a}",
            "arn:aws:s3:::${var.bucket_b}/*"

         ]
      }
   ]
}
EOF
}

# Policitca de acesso a usuários do grupo Nexxus

resource "aws_iam_group_policy" "policy_group_b" {
  name  = "policy_group_nexxus"
  group = aws_iam_group.group_b.id

  policy = <<EOF
{
   "Version":"2012-10-17",
   "Statement":[
      {
         "Effect":"Allow",
         "Action": "s3:ListAllMyBuckets",
         "Resource":"arn:aws:s3:::*"
      },
      
      {
         "Effect":"Allow",
         "Action":[
            "s3:ListBucket",
            "s3:ListObjectsV2",
            "s3:GetObject",
            "s3:GetObjectAcl"
         ],
         "Resource": [
            "arn:aws:s3:::${var.bucket_a}",
            "arn:aws:s3:::${var.bucket_b}/*"

         ]
      }
   ]
}
EOF
}


# Policitca de acesso a usuários do grupo Anbima

resource "aws_iam_group_policy" "policy_group_anbima" {
  name  = "policy_group_anbima"
  group = aws_iam_group.group_c.id

  policy = <<EOF
{
   "Version":"2012-10-17",
   "Statement":[
      {
         "Effect":"Allow",
         "Action": "s3:ListAllMyBuckets",
         "Resource":"arn:aws:s3:::*"
      },
      
      {
         "Effect":"Allow",
         "Action":[
            "s3:ListBucket",
            "s3:ListObjectsV2",
            "s3:PutObject",
            "s3:PutObjectAcl"
         ],
         "Resource":[
            "arn:aws:s3:::${var.bucket_a}",
            "arn:aws:s3:::${var.bucket_b}/*"
         ]
      }
   ]
}
EOF
}

# Policitca de acesso a usuários do grupo tera acesso full aos buckets

resource "aws_iam_group_policy" "policy_group_admin" {
  name  = "policy_group_admin"
  group = aws_iam_group.group_admin.id

  policy = <<EOF
{
   "Version":"2012-10-17",
   "Statement":[
      {
         "Effect":"Allow",
         "Action": "s3:ListAllMyBuckets",
         "Resource":"arn:aws:s3:::*"
      },
      
      {
         "Effect":"Allow",
         "Action": "s3:*",
         "Resource":[
            "arn:aws:s3:::${var.bucket_a}",
            "arn:aws:s3:::${var.bucket_a}/*",
            "arn:aws:s3:::${var.bucket_b}",
            "arn:aws:s3:::${var.bucket_b}/*"
         ]
      }
   ]
}
EOF
}