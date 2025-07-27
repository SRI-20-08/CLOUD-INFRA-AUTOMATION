resource "aws_vpc" "main" {
  cidr_block       = var.iprange
  instance_tenancy = "default"

  tags = {
    Name = "vpc-${var.env}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "ig-${var.env}"
  }
}

resource "aws_eip" "natip" {
#  instance = aws_instance.web.id
  domain   = "vpc"
}

resource "aws_nat_gateway" "NATgtw" {
  allocation_id = aws_eip.natip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}

# resource "aws_db_subnet_group" "public" {
#   name       = var.rds_subnet_group
#   subnet_ids = [aws_subnet.db1.id, aws_subnet.db2.id]

#   tags = {
#     Name = var.rds_subnet_group
#   }
# }

# resource "aws_db_subnet_group" "private" {
#   name       = var.rds_subnet_group
#   subnet_ids = [aws_subnet.db1.id, aws_subnet.db2.id]

#   tags = {
#     Name = var.rds_subnet_group
#   }
# }


# resource "aws_vpc_dhcp_options" "dhcp" {
#   domain_name          = var.domainname
#   domain_name_servers  = [aws_instance.dc.private_ip, "10.0.0.2"]
#   ntp_servers          = ["169.254.169.123"]
#   netbios_node_type    = 2
#   netbios_name_servers = [aws_instance.dc.private_ip]

#   tags = {
#     Name = var.domainname
#   }

#   depends_on = [
#       aws_instance.dc
#   ]
# }

# resource "aws_vpc_dhcp_options_association" "dhcp_associated" {
#   vpc_id          = aws_vpc.main.id
#   dhcp_options_id = aws_vpc_dhcp_options.dhcp.id
# }


# resource "aws_network_acl" "nacl" {
#   vpc_id = aws_vpc.main.id
#   subnet_ids = [ aws_subnet.robot1.id, aws_subnet.robot2.id ]

#   egress {
#     protocol   = "tcp"
#     rule_no    = 100
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 0
#     to_port    = 0
#   }

#   ingress {
#     protocol   = "tcp"
#     rule_no    = 100
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 0
#     to_port    = 0
#   }

#   tags = {
#     Name = "main"
#   }
# }



/*

Need to review this properly

*/

/*
resource "aws_ec2_transit_gateway" "transit-gateway" {
  description = "transit-gateway"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgwattachment" {
  subnet_ids         = [aws_subnet.admin1.id, aws_subnet.admin2.id]
  transit_gateway_id = aws_ec2_transit_gateway.transit-gateway.id
  vpc_id             = aws_vpc.main.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_ec2_transit_gateway.transit-gateway.id
  }

  tags = {
    Name = "Private route table"
  }

  depends_on = [
    aws_ec2_transit_gateway.transit-gateway, aws_internet_gateway.gw
  ]

  
}
*/

