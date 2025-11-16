resource "aws_security_group" "barret-sg" {
  name        = "barret-sg"
  description = "Allow inbound traffic and all outbound traffic to barretts bar"
  vpc_id      = aws_vpc.barret-vpc.id

  tags = {
    Name = "barret-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "barret-sg-http" {
  description = "HTTP Access"
  cidr_ipv4 = aws_vpc.barret-vpc.cidr_block
  security_group_id = aws_security_group.barret-lb.id
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Name = "HTTP"
  }
}

resource "aws_vpc_security_group_ingress_rule" "barret-sg-ssh" {
  description = "SSH Access from internet"
  security_group_id = aws_security_group.barret-lb.id
  cidr_ipv4 = aws_vpc.barret-vpc.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    Name = "SSH"
  }
}

resource "aws_vpc_security_group_egress_rule" "barret-sg-egress-allow-all-ipv4" {
  security_group_id = aws_security_group.barret-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
