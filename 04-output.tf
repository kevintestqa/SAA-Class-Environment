output "website-url" {
  value = "\nhttp://${aws_s3_bucket_website_configuration.lizzos-site.website_endpoint}\n"
}

output "bucket-info" {
  value = {
    name = aws_s3_bucket.terraform-sunday.bucket
    arn = aws_s3_bucket.terraform-sunday.arn
  }
}

output "policy-info" {
  value = "\n${aws_s3_bucket_policy.public-access.policy}\n"
}