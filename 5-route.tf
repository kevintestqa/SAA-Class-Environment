resource "aws_route_table" "gongaga-public-route-table" {
    vpc_id = aws_vpc.barret-vpc.id
    
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.kalm-igw.id
    }

    tags = {
      "Name" = "gongaga-public-route-table"
    }

    depends_on = [ aws_internet_gateway.kalm-igw]
}

resource "aws_route_table_association" "public-1a" {
    route_table_id = aws_route_table.gongaga-public-route-table.id
    subnet_id = aws_subnet.public-us-west-1a.id
}

resource "aws_route_table_association" "public-1c" {
    route_table_id = aws_route_table.gongaga-public-route-table.id
    subnet_id = aws_subnet.public-us-west-1c.id
}

########## Private Route Table REMEMBER TO ADD A RPIVATE ROUTE TABLE FIRST ############

resource "aws_route_table" "goldsaucer-private-route-table" {
    vpc_id = aws_vpc.barret-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.cosmo-canyon-nat.id
    }

    tags = {
        Name = "gold-saucer-private-route-table"
    }
    
}

resource "aws_route_table_association" "private-1a" {
    route_table_id = aws_route_table.goldsaucer-private-route-table.id
    subnet_id = aws_subnet.private-us-west-1a.id
}

resource "aws_route_table_association" "private-1c" {
    route_table_id = aws_route_table.goldsaucer-private-route-table.id
    subnet_id = aws_subnet.private-us-west-1c.id
}