

resource "aws_security_group" "allow-internal" {
  name = "Allow Internal"
  description = "Allow Internal"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port = 3389
    protocol = "tcp"
    to_port = 3389
    cidr_blocks = [var.iprange]   
  }
}

# resource "aws_security_group" "ad" {
#   name = "Ad-Communication"
#   description = "Ad-Communication"
#   vpc_id = aws_vpc.main.id


#   ingress {
#     from_port = 445
#     protocol = "udp"
#     to_port = 445
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 636
#     protocol = "tcp"
#     to_port = 636
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 389
#     protocol = "udp"
#     to_port = 389
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 137
#     protocol = "tcp"
#     to_port = 137
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 53
#     protocol = "udp"
#     to_port = 53
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 123
#     protocol = "udp"
#     to_port = 123
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 389
#     protocol = "tcp"
#     to_port = 389
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 636
#     protocol = "udp"
#     to_port = 636
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 3268
#     protocol = "tcp"
#     to_port = 3269
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 464
#     protocol = "udp"
#     to_port = 464
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 88
#     protocol = "udp"
#     to_port = 88
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 88
#     protocol = "udp"
#     to_port = 88
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 1512
#     protocol = "udp"
#     to_port = 1512
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 6000
#     protocol = "tcp"
#     to_port = 6020
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 5722
#     protocol = "tcp"
#     to_port = 5722
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 464
#     protocol = "tcp"
#     to_port = 464
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 53
#     protocol = "tcp"
#     to_port = 53
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 137
#     protocol = "udp"
#     to_port = 138
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 135
#     protocol = "udp"
#     to_port = 135
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 1512
#     protocol = "tcp"
#     to_port = 1512
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 139
#     protocol = "tcp"
#     to_port = 139
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 445
#     protocol = "tcp"
#     to_port = 445
#     cidr_blocks = [var.iprange]
#   }

#   ingress {
#     from_port = 88
#     protocol = "tcp"
#     to_port = 88
#     cidr_blocks = [var.iprange]
#   }

#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_security_group" "cntrl-na" {
#   name = "Control NA SMB"
#   description = "Control NA SMB"
#   vpc_id = aws_vpc.main.id

#   ingress {
#     from_port = 445
#     protocol = "tcp"
#     to_port = 445
#     cidr_blocks = [var.ctrl-na]
#   }


#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }



#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_security_group" "appserversg" {
#   name = "App Server"
#   description = "To be Applied on App Server"
#   vpc_id = aws_vpc.main.id

#   ingress {
#     from_port = 8197
#     protocol = "tcp"
#     to_port = 8199
#     cidr_blocks = [var.iprange]
#   }


#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_security_group" "bprobotssg" {
#   name = "BP-Robots"
#   description = "To be Applied on INTCs and Robots"
#   vpc_id = aws_vpc.main.id

#   ingress {
#     from_port = 8197
#     protocol = "tcp"
#     to_port = 8199
#     cidr_blocks = [aws_subnet.robot1.cidr_block, aws_subnet.robot2.cidr_block]
#   }


#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_security_group" "blueprism7" {
#   name = "BluePrism 7 ports"
#   description = "To be Applied on App Server, intcs and robots"
#   vpc_id = aws_vpc.main.id

#   ingress {
#     from_port = 10000
#     protocol = "tcp"
#     to_port = 10002
#     cidr_blocks = [var.iprange]
#   }


#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }


# resource "aws_security_group" "http-https" {
#   name = "Hyperscience"
#   description = "To be Applied on resources that need http/https access"
#   vpc_id = aws_vpc.main.id

#   ingress {
#     from_port = 80
#     protocol = "tcp"
#     to_port = 80
#     cidr_blocks = [var.gpeu, var.gpna, var.iprange]
#   }

#   ingress {
#     from_port = 443
#     protocol = "tcp"
#     to_port = 443
#     cidr_blocks = [var.gpeu, var.gpna, var.iprange]
#   }

#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_security_group" "ssh" {
#   name = "SSH"
#   description = "To be Applied on resources that need ssh access"
#   vpc_id = aws_vpc.main.id

#   ingress {
#     from_port = 22
#     protocol = "tcp"
#     to_port = 22
#     cidr_blocks = [var.gpeu, var.gpna]
#   }

#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_security_group" "rdp" {
#   name = "RDP"
#   description = "To be Applied on resources that need rdp access"
#   vpc_id = aws_vpc.main.id

#   ingress {
#     from_port = 3389
#     protocol = "tcp"
#     to_port = 3389
#     cidr_blocks = [var.gpeu, var.gpna]
#   }

#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_security_group" "vnc" {
#   name = "VNC"
#   description = "To be Applied on resources that need vnc"
#   vpc_id = aws_vpc.main.id

#   ingress {
#     from_port = 5900
#     protocol = "tcp"
#     to_port = 5900
#     cidr_blocks = [var.iprange]
#   }

#     ingress {
#     from_port = 5800
#     protocol = "tcp"
#     to_port = 5800
#     cidr_blocks = [var.iprange]
#   }

#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_security_group" "appserver-to-db" {
#   name = "App Server to Database"
#   description = "To be applied on Application Server for it to access the DB"
#   vpc_id = aws_vpc.main.id

#   ingress {
#     from_port = 1433
#     protocol = "tcp"
#     to_port = 1433
#     cidr_blocks = [aws_subnet.appserver1.cidr_block]
#   }

#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# /* 

# Need to review the following 

# */

# resource "aws_security_group" "ctrl-na-smb" {
#   name = "SMB CTRL NA"
#   description = "SMB CTRL NA"
#   vpc_id = aws_vpc.main.id

#   ingress {
#     from_port = 445
#     protocol = "tcp"
#     to_port = 445
#     cidr_blocks = [var.ctrl-na]
#   }

#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_security_group" "net-sec" {
#   name = "Net-sec Scanner"
#   description = "Net-sec Scanner"
#   vpc_id = aws_vpc.main.id

#   ingress {
#     from_port = 0
#     protocol = "-1"
#     to_port = 0
#     cidr_blocks = [var.vuln-scanner]
#   }


#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }