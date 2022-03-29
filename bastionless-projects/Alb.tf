resource "aws_lb" "lbrole" {
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
  idle_timeout       = 120

  subnets         = [aws_subnet.subnt1[0].id, aws_subnet.subnt1[1].id, aws_subnet.subnt1[2].id]
  security_groups = [aws_security_group.securelnk3.id]

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_lb_listener" "alblisnter" {
  load_balancer_arn = aws_lb.lbrole.arn
  port              = var.ports[1]
  protocol          = "HTTP"
  lifecycle {
    create_before_destroy = true

  }
  default_action {
    target_group_arn = aws_lb_target_group.targetrole.arn
    type             = "forward"
  }
}
resource "aws_lb_listener_rule" "rule1" {
  listener_arn = aws_lb_listener.alblisnter.arn
  condition {
    http_request_method {
      values = ["GET", "HEAD"]
    }
  }
  action {
    target_group_arn = aws_lb_target_group.targetrole.arn
    type             = "forward"

  }
  lifecycle {
    create_before_destroy = true
  }


}

resource "aws_lb_target_group" "targetrole" {
  load_balancing_algorithm_type = "round_robin"
  lifecycle {
    create_before_destroy = true
  }
  vpc_id      = aws_vpc.vpcrole.id
  port        = var.ports[1]
  protocol    = "HTTP"
  target_type = "instance"
  health_check {
    port                = var.ports[1]
    protocol            = "HTTP"
    path                = "/"
    interval            = 6
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 3
  }
}