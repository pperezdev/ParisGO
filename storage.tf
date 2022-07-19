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

resource "aws_transfer_server" "awstserverpa4dd01" {
  tags = {
    Name = "awstserverpa4dd01"
  }
}

resource "aws_transfer_access" "awstaccesspa4dd01" {
  external_id    = "S-1-1-12-1234567890-123456789-1234567890-1234"
  server_id      = aws_transfer_server.awstserverpa4dd01.id
  role           = aws_iam_role.ftp.arn
  home_directory = "/${aws_s3_bucket.s3pa4dd01.id}/"
}