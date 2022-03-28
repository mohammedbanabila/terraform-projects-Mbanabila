# for gateway  endpoint
resource "aws_vpc_endpoint" "endptlnk" {
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.routelink1[count.index].id]
  vpc_id            = aws_vpc.vpcrole.id
  service_name      = "com.amazonaws.us-east-1.s3"
  count             = 3
}