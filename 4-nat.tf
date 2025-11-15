resource "aws_eip" "rocket-town-eip" {
    domain = "vpc"

    tags = {
      "Name" = "rocket-town-eip"
    }
}


resource "aws_nat_gateway" "cosmo-canyon-nat" {
    allocation_id = aws_eip.rocket-town-eip.id
    subnet_id = aws_subnet.public-us-west-1a.id
    
    tags = {
      "Name" = "cosmo-canyon-nat"
    }
}