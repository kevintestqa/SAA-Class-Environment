resource "aws_s3_bucket_website_configuration" "static_site_documents_endpoints" {
    bucket = aws_s3_bucket.static_site.id
    
    index_document {
      suffix = "index.html"
    }

    error_document {
      key = "error.html"
    }
}


##########################
resource "aws_s3_bucket_public_access_block" "block_access_settings" {
    bucket = aws_s3_bucket.static_site.id

    block_public_acls = true
    block_public_policy = false
    ignore_public_acls = true
    restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "static_site_public_read" {
    bucket = aws_s3_bucket.static_site.id

    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.static_site.arn}/*"
      }
    ]
  })
    depends_on = [aws_s3_bucket_public_access_block.block_access_settings]
}
