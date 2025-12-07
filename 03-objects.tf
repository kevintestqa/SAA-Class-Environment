resource "aws_s3_object" "index" {
    bucket = aws_s3_bucket.terraform-sunday.id
    key = "index.html"
    source = "/Users/kevinwillocks/TheoWAF/class7/AWS/Terraform/2025Dec7/index.html"
    content_type = "text/html"
    etag = filemd5("/Users/kevinwillocks/TheoWAF/class7/AWS/Terraform/2025Dec7/index.html")
}

resource "aws_s3_object" "error" {
    bucket = aws_s3_bucket.terraform-sunday.id
    key = "error.html"
    source = "/Users/kevinwillocks/TheoWAF/class7/AWS/Terraform/2025Dec7/error.html"
    content_type = "text/html"
    etag = filemd5("/Users/kevinwillocks/TheoWAF/class7/AWS/Terraform/2025Dec7/error.html")
}

resource "aws_s3_object" "panama" {
    bucket = aws_s3_bucket.terraform-sunday.id
    key = "Panama-City-Panama-Trip-02.jpg"
    source = "${path.root}/Panama-City-Panama-Trip-02.jpg"
    content_type = "image/jpeg"
    etag = filemd5("${path.root}/Panama-City-Panama-Trip-02.jpg")
}

resource "aws_s3_object" "image" {
    bucket = aws_s3_bucket.terraform-sunday.id
    key = "image.jpg"
    source = "${path.root}/image.jpg"
    content_type = "image/jpeg"
    etag = filemd5("${path.root}/image.jpg")
}