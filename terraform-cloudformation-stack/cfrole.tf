resource "aws_iam_role" "cfrole" {
  name = "cfrole"
  assume_role_policy = jsonencode({
    "Version" = "2010-10-17",
    "Statement" = [{
      "Effect" = "Allow",
      "Action" = "sts:AssumeRole",
      "Principal" = {
        "Service" = "cloudformation.amazonaws.com"
      }

    }]
  })

}

resource "aws_iam_policy" "cfpolicy" {
  name = "cfpolicy"
  policy = jsonencode({

    "Version" = "2010-10-17",
    "Statement" = [{

      "Effect" = "Allow",
      "Action" = [
        "s3:ListBucket",
        "s3:ListAllMyBuckets",
        "s3:GetObject",
        "s3:PutObject"
      ]

      "Resource" = ["arn:aws:s3:::cfbucktslist/*", "arn:aws:s3:::bcktslist/*", "arn:aws:s3:::*"]

    }]


  })

}