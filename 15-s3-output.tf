output "website-url" {
  value = "\nhttp://${aws_s3_bucket_website_configuration.static_site_documents_endpoints}\n"
}

output "bucket-info" {
  value = {
    name = aws_s3_bucket.static_site.bucket
    arn = aws_s3_bucket.static_site.arn
  }
}

output "policy-info" {
  value = "\n${aws_s3_bucket_policy.access_policy_public}\n"
}