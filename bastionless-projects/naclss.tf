
# for public subnet
resource "aws_network_acl" "nacl1" {
  vpc_id = aws_vpc.vpcrole.id
  ingress {
    action     = "allow"
    cidr_block = var.publicsbnts[0]
    from_port  = var.ports[0]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 10
    to_port    = var.ports[0]
  }
  ingress {
    action     = "allow"
    cidr_block = var.publicsbnts[0]
    from_port  = var.ports[1]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 11
    to_port    = var.ports[1]
  }
  ingress {
    action     = "allow"
    cidr_block = var.publicsbnts[0]
    from_port  = var.ports[2]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 12
    to_port    = var.ports[2]
  }
  ingress {
    action     = "allow"
    cidr_block = var.publicsbnts[0]
    from_port  = var.ports[3]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 13
    to_port    = var.ports[3]
  }
  ingress {
    action     = "allow"
    cidr_block = var.publicsbnts[1]
    from_port  = var.ports[0]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 20
    to_port    = var.ports[0]
  }

  ingress {
    action     = "allow"
    cidr_block = var.publicsbnts[1]
    from_port  = var.ports[1]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 21
    to_port    = var.ports[1]
  }
  ingress {
    action     = "allow"
    cidr_block = var.publicsbnts[1]
    from_port  = var.ports[2]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 22
    to_port    = var.ports[2]
  }
  ingress {
    action     = "allow"
    cidr_block = var.publicsbnts[1]
    from_port  = var.ports[3]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 23
    to_port    = var.ports[3]
  }






  ingress {
    action     = "allow"
    cidr_block = var.publicsbnts[2]
    from_port  = var.ports[0]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 30
    to_port    = var.ports[0]
  }

  ingress {
    action     = "allow"
    cidr_block = var.publicsbnts[2]
    from_port  = var.ports[1]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 31
    to_port    = var.ports[1]
  }
  ingress {
    action     = "allow"
    cidr_block = var.publicsbnts[2]
    from_port  = var.ports[2]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 32
    to_port    = var.ports[2]
  }
  ingress {
    action     = "allow"
    cidr_block = var.publicsbnts[2]
    from_port  = var.ports[3]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 33
    to_port    = var.ports[3]
  }


  egress {
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "-1"
    rule_no    = 200
    to_port    = 0
  }
}




# for  db

resource "aws_network_acl" "nacl2" {
  vpc_id = aws_vpc.vpcrole.id
  ingress {
    action     = "allow"
    cidr_block = var.privatesbnts[0]
    from_port  = var.ports[0]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 40
    to_port    = var.ports[0]
  }
  ingress {
    action     = "allow"
    cidr_block = var.privatesbnts[0]
    from_port  = var.ports[1]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 41
    to_port    = var.ports[1]
  }
  ingress {
    action     = "allow"
    cidr_block = var.privatesbnts[0]
    from_port  = var.ports[2]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 42
    to_port    = var.ports[2]
  }
  ingress {
    action     = "allow"
    cidr_block = var.privatesbnts[0]
    from_port  = var.ports[3]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 43
    to_port    = var.ports[3]
  }
  ingress {
    action     = "allow"
    cidr_block = var.privatesbnts[1]
    from_port  = var.ports[0]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 50
    to_port    = var.ports[0]
  }

  ingress {
    action     = "allow"
    cidr_block = var.privatesbnts[1]
    from_port  = var.ports[1]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 51
    to_port    = var.ports[1]
  }
  ingress {
    action     = "allow"
    cidr_block = var.privatesbnts[1]
    from_port  = var.ports[2]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 52
    to_port    = var.ports[2]
  }
  ingress {
    action     = "allow"
    cidr_block = var.privatesbnts[1]
    from_port  = var.ports[3]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 53
    to_port    = var.ports[3]
  }

  ingress {
    action     = "allow"
    cidr_block = var.privatesbnts[2]
    from_port  = var.ports[0]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 60
    to_port    = var.ports[0]
  }

  ingress {
    action     = "allow"
    cidr_block = var.privatesbnts[2]
    from_port  = var.ports[1]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 61
    to_port    = var.ports[1]
  }
  ingress {
    action     = "allow"
    cidr_block = var.privatesbnts[2]
    from_port  = var.ports[2]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 62
    to_port    = var.ports[2]
  }
  ingress {
    action     = "allow"
    cidr_block = var.privatesbnts[2]
    from_port  = var.ports[3]
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "tcp"
    rule_no    = 63
    to_port    = var.ports[3]
  }


  egress {
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    icmp_code  = 1
    icmp_type  = 1
    protocol   = "-1"
    rule_no    = 200
    to_port    = 0
  }
}