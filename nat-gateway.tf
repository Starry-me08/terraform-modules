resource "aws_subnet" "nat_gateway" {
  availability_zone = element(var.azs, count.index)
  cidr_block        = "10.0.150.0/24"
  vpc_id            = aws_vpc.main.id
  tags = {
    "Name" = "Infra-Subnet-NAT"
  }
}

resource "aws_eip" "nat_gw_eip" {
  vpc = true
}
resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id     = element(aws_subnet.public_subnets.*.id, 1)
}

resource "aws_route_table" "nat_gateway" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw.id
  }
}

resource "aws_route_table_association" "vpc-nat-assoc" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public_subnets.*.id, count.index)
  route_table_id = aws_route_table.route-table.id

}