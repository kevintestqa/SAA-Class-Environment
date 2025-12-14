resource "aws_s3_bucket" "static_site" {
    bucket = "kevin-storage"
    force_destroy = true
    
}
