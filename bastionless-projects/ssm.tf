resource "aws_ssm_document" "ssmddoc" {
  name            = "myssmdoc"
  document_format = "YAML"
  document_type   = "Command"
  version_name    = "docvrsn1"

  content = <<DOC
schemaVersion: '1.2'
description: Check ip configuration of a Linux instance.
parameters: {}
runtimeConfig:
  'aws:runShellScript':
    properties:
      - id: '0.aws:runShellScript'
        runCommand:
          - sudo yum update -y 
          - sudo yum upgrade -y
          - sudo yum install httpd -y 
          - sudo systemctl start httpd 
          - sudo systemctl enable httpd 
          - sudo systemctl status amazon-ssm-agent
          - sudo systemctl enable amazon-ssm-agent
<<<<<<< HEAD
          - cd/var/www/html/
          - sudo mkdir images 
          - sudo mkdir css
          - sudo chmod 777 /var/www/html/images
          - sudo chmod 777 /var/www/html/css
          - sudo chmod 777 /var/www/html/images/cloud-computing.png
          - sudo chmod 777 /var/www/html/css/styles.css
=======
          - cd /var/www/html/
          - sudo mkdir images 
          - sudo mkdir css
>>>>>>> 9ebd84a920975f8fe341edcd9fd3634d3d26c17f
          - sudo aws s3 cp s3://mybkctlist/index.html > /var/www/html/index.html
          - sudo aws s3 cp s3://mybkctlist/cloud-computing.png > /var/www/html/images/cloud-computing.png
          - sudo aws s3 cp s3://mybkctlist/styles.css > /var/www/html/css/styles.css

DOC
}

resource "aws_ssm_association" "ssmlink" {
  name             = aws_ssm_document.ssmddoc.name
  document_version = aws_ssm_document.ssmddoc.document_version
  association_name = "myssmassociate"
  targets {
    key    = "InstanceIds"
    values = ["*"]
  }
<<<<<<< HEAD
}
=======
}

resource "aws_ssm_activation" "ssmact" {
  name               = "myssmact"
  iam_role           = aws_iam_role.ssmrole.id
  registration_limit = "10"
  depends_on = [
    aws_iam_role_policy_attachment.ssmattach
  ]
}
>>>>>>> 9ebd84a920975f8fe341edcd9fd3634d3d26c17f
