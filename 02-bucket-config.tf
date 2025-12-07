resource "aws_s3_bucket_website_configuration" "lizzos-site" {
    bucket = aws_s3_bucket.terraform-sunday.id
    
    index_document {
      suffix = "index.html"
    }

    error_document {
      key = "error.html"
    }
}


##########################
resource "aws_s3_bucket_public_access_block" "for-the-streets" {
    bucket = aws_s3_bucket.terraform-sunday.id

    block_public_acls = true
    block_public_policy = false
    ignore_public_acls = true
    restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public-access" {
    bucket = aws_s3_bucket.terraform-sunday.id

    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.terraform-sunday.arn}/*"
      }
    ]
  })
    depends_on = [aws_s3_bucket_public_access_block.for-the-streets]
}
