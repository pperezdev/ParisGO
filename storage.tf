resource "aws_s3_bucket" "s3pa4dd01" {
  bucket = "s3pa4dd01"

  tags = {
    Name        = "dev"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "raw_files" {
    bucket  = "${s3pa4dd01.default.id}"
    acl     = "private"
    key     =  "raw_files"
    content_type = "application/x-directory"
}

resource "aws_s3_bucket_object" "refined_files" {
    bucket  = "${s3pa4dd01.default.id}"
    acl     = "private"
    key     =  "refined_files"
    content_type = "application/x-directory"
}