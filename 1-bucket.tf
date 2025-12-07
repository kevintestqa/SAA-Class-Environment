resource "aws_s3_bucket" "terraform-sunday" {
    bucket = "lizzos-brunch-dinner-snack"
    force_destroy = true
    
}
