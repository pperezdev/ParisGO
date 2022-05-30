resource "aws_s3_bucket" "s3pa4dd01" {
  bucket = "s3pa4dd01"

  tags = {
    Name        = "dev"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "raw_folder" {
    bucket  = "${aws_s3_bucket.s3pa4dd01.id}"
    acl     = "private"
    key     =  "raw_folder/"
    source  = "/dev/null"
}

resource "aws_s3_bucket_object" "refined_folder" {
    bucket  = "${aws_s3_bucket.s3pa4dd01.id}"
    acl     = "private"
    key     =  "refined_folder/"
    source  = "/dev/null"
}