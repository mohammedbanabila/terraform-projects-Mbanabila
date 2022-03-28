resource "aws_s3_bucket" "bkctrole" {
  bucket = "mybkctlist"
}
resource "aws_s3_bucket_acl" "bkctacl" {
  bucket = aws_s3_bucket.bkctrole.id
  acl    = "private"
}
resource "aws_s3_bucket_versioning" "bkctvers" {
  bucket = aws_s3_bucket.bkctrole.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "bkctindx" {
  bucket = aws_s3_bucket.bkctrole.id
  key    = "index.html"
  source = "./sites/index.html"
}
resource "aws_s3_object" "bkctstyles" {
  bucket = aws_s3_bucket.bkctrole.id
  key    = "cloud-computing.png"
  source = "./sites/cloud-computing.png"
}
resource "aws_s3_object" "bkctpic" {
  bucket = aws_s3_bucket.bkctrole.id
  key    = "styles.css"
  source = "./sites/styles.css"
}