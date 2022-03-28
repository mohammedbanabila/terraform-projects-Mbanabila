
resource "aws_launch_template" "temprole" {
  image_id               = var.tools["ami1"]
  key_name               = var.tools["keys1"]
  instance_type          = var.tools["inststype"]
  vpc_security_group_ids = [aws_security_group.securelnk1.id]
  block_device_mappings {
    device_name = "/dev/sdn"
    ebs {
      volume_size = 8
      volume_type = "gp2"
    }
  }
  iam_instance_profile {
    arn = aws_iam_instance_profile.ssmprofile.arn
  }
}

resource "aws_autoscaling_group" "grprole" {
  name                      = "mygrprole"
  min_size                  = 1
  max_size                  = 9
  desired_capacity          = 3
  default_cooldown          = 300
  vpc_zone_identifier       = [aws_subnet.subnt1[0].id, aws_subnet.subnt1[1].id, aws_subnet.subnt1[2].id]
  health_check_grace_period = 300
  health_check_type         = "ELB"
  launch_template {
    id      = aws_launch_template.temprole.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "scalerole" {
  autoscaling_group_name = aws_autoscaling_group.grprole.name
  lb_target_group_arn    = aws_lb_target_group.targetrole.arn
}