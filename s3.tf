#--Bucket A

resource "aws_s3_bucket" "bucket_a" {
    bucket = var.bucket_a
    acl    = "private"
    region = var.aws_region
    versioning {
        enabled = true
    }
    
    tags = {
        Name = "bucket_a"
    }
}


#--Bucket B
resource "aws_s3_bucket" "bucket_b" {
bucket = var.bucket_b
acl    = "private"
region = var.aws_region
    versioning {
        enabled = true
    }
    
    tags = {
        Name = "bucket_b"
    }
}