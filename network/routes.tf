resource "aws_route_table" "pub_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table" "vm_internet_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NATgtw.id
  }

  tags = {
    Name = "vm-internet-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.pub_route.id
}

resource "aws_route_table_association" "vm_internet" {
  subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.vm_internet_route.id
}
