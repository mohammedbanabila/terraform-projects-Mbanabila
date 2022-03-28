# for public subnet 
resource "aws_security_group" "securelnk1" {
  name   = "mysecure1"
  vpc_id = aws_vpc.vpcrole.id

  dynamic "ingress" {
    for_each = [var.ports[0], var.ports[3]]
    iterator = ports
    content {
      cidr_blocks = ["41.79.199.49/32"]
      from_port   = ports.value
      to_port     = ports.value
      protocol    = "tcp"
    }
  }


  dynamic "ingress" {
    for_each = [var.ports[1], var.ports[2]]
    iterator = ports
    content {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = ports.value
      to_port     = ports.value
      protocol    = "tcp"
    }

  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

}

# for private subnet 
resource "aws_security_group" "securelnk2" {
  name   = "mysecure2"
  vpc_id = aws_vpc.vpcrole.id

  dynamic "ingress" {
    for_each = [var.ports[0], var.ports[3]]
    iterator = ports
    content {
      security_groups = [aws_security_group.securelnk1.id]
      from_port       = ports.value
      to_port         = ports.value
      protocol        = "tcp"
    }
  }

  dynamic "ingress" {
    for_each = [var.ports[1], var.ports[2]]
    iterator = ports
    content {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = ports.value
      to_port     = ports.value
      protocol    = "tcp"
    }

  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}


# for Alb  
resource "aws_security_group" "securelnk3" {
  name   = "mysecure3"
  vpc_id = aws_vpc.vpcrole.id

  dynamic "ingress" {
    for_each = [var.ports[1], var.ports[2]]
    iterator = ports
    content {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = ports.value
      to_port     = ports.value
      protocol    = "tcp"
    }
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}