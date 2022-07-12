# create cloudformation stack
resource "aws_cloudformation_stack" "mystack" {

  name = "mystacks"

  on_failure = "ROLLBACK"

  iam_role_arn = aws_iam_role.cfrole.arn
 
  template_url = "s3://bcktslist.us-east-1.amazonaws.com/cflab.yml"
  
}

resource "aws_cloudformation_type" "cftypes" {

  type = "RESOURCE"

  type_name              = "cfeast1::cfeast1Service::cfeast1-Resource"
  schema_handler_package = "s3://cfbucktslist.us-east-1.amazonaws.com/*"
}

#create s3 bucket  that hold cloudformation as yaml file to run it in cloudformation
resource "aws_s3_bucket" "cfbckts" {
  bucket = "cfbucktslist"
}
resource "aws_s3_bucket_acl" "bkctacl" {
  acl    = "private"
  bucket = aws_s3_bucket.cfbckts.bucket
}
resource "aws_s3_bucket_versioning" "bukctversn" {
  bucket = aws_s3_bucket.cfbckts.bucket
  versioning_configuration {
    status = "Enabled"
  }

}


resource "aws_s3_bucket" "bckts" {
  bucket = "bcktslist"
}
resource "aws_s3_bucket_acl" "bcketacl" {
  acl    = "private"
  bucket = aws_s3_bucket.bckts.bucket
}
resource "aws_s3_bucket_versioning" "bukctvers" {
  bucket = aws_s3_bucket.bckts.bucket
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_object" "file1" {
  key    = "cflab.yml"
  bucket = aws_s3_bucket.bckts.bucket
  source = "./cflab.yml"
}