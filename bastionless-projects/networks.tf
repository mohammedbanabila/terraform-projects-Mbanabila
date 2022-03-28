resource "aws_vpc" "vpcrole" {
  cidr_block = var.vpc_cidrs
  tags = {
    "Name" = var.vpctags1
  }
}

resource "aws_internet_gateway" "intgw" {
  vpc_id = aws_vpc.vpcrole.id
}
resource "aws_subnet" "subnt1" {
  vpc_id                  = aws_vpc.vpcrole.id
  cidr_block              = var.publicsbnts[count.index]
  availability_zone       = var.zones[count.index]
  map_public_ip_on_launch = true
  tags = {
    "Name" = var.tags1[count.index]
  }
  count = 3
}

resource "aws_subnet" "subnt2" {
  vpc_id            = aws_vpc.vpcrole.id
  cidr_block        = var.privatesbnts[count.index]
  availability_zone = var.zones[count.index]
  tags = {
    "Name" = var.tags2[count.index]
  }

  count = 3

}


resource "aws_route_table" "routelink1" {
  vpc_id = aws_vpc.vpcrole.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.intgw.id
  }
  tags = {
    "Name" = length(var.routetable1tags)
  }
  count = 3

}
resource "aws_route_table_association" "associate1" {
  route_table_id = aws_route_table.routelink1[count.index].id
  subnet_id      = aws_subnet.subnt1[count.index].id
  count          = 3
}
resource "aws_eip" "eip1role" {
  vpc   = true
  count = 3
  depends_on = [
    aws_internet_gateway.intgw
  ]
}

resource "aws_nat_gateway" "natgw" {
  allocation_id     = aws_eip.eip1role[count.index].id
  subnet_id         = aws_subnet.subnt1[count.index].id
  count             = 3
  connectivity_type = "public"
  depends_on = [
    aws_internet_gateway.intgw
  ]
}

resource "aws_route_table" "routelink2" {
  vpc_id = aws_vpc.vpcrole.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw[count.index].id
  }
  tags = {
    "Name" = length(var.routetable2tags)
  }
  count = 3

}

resource "aws_route_table_association" "associate2" {
  route_table_id = aws_route_table.routelink2[count.index].id
  subnet_id      = aws_subnet.subnt2[count.index].id
  count          = 3
}