resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket

  tags ={
    Name        = "Website"
    Environment = "production"
  }

  policy = <<EOF
    {
        "Version": "2008-10-17",
        "Statement": [
            {
                "Sid": "PublicReadForGetBucketObjects",
                "Effect": "Allow",
                "Principal": "*",
                "Action": "s3:*",
                "Resource": "arn:aws:s3:::${var.s3_bucket}/*"
    }
  ]
}
EOF
  
  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}
