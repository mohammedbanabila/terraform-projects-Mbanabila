
resource "aws_iam_role" "ssmrole" {
  name = "myssmrole"
  assume_role_policy = jsonencode({
    "Version" = "2012-10-17",
    "Statement" = [{
      "Effect" = "Allow",
      "Action" = "sts:AssumeRole",
      "Principal" = {
        "Service" = "ec2.amazonaws.com"
      }
    }]
  })
}
resource "aws_iam_role_policy" "endptpolicy" {
  name = "myendptpolicy"
  role = aws_iam_role.ssmrole.id
  policy = jsonencode({
    "Version" = "2012-10-17",
    "Statement" = [{
      "Effect" = "Allow",
      "Action" = [
        "s3:PutObject",
        "s3:GetObject",
        "s3:ListBucket",
        "s3:ListAllMyBuckets"
      ]
      "Resource" = ["arn:aws:s3:::mybkctlist/*", "arn:aws:s3:::*"]
    }]
  })

}

resource "aws_iam_role_policy_attachment" "ssmattach" {
  role       = aws_iam_role.ssmrole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}


resource "aws_iam_instance_profile" "ssmprofile" {
  name = "myssmprofile"
  role = aws_iam_role.ssmrole.name
}


