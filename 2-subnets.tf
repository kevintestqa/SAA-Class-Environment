resource "aws_subnet" "public-us-west-1a" {
    vpc_id = aws_vpc.barret-vpc.id
    cidr_block = "10.45.1.0/24"
    availability_zone = "us-west-1a"
    map_public_ip_on_launch = true

    tags = {
      "Name" = "public-subnet-us-west-1a"
    }
}

resource "aws_subnet" "public-us-west-1c" {
    vpc_id = aws_vpc.barret-vpc.id
    cidr_block = "10.45.3.0/24"
    availability_zone = "us-west-1c"
    map_public_ip_on_launch = true

    tags = {
      "Name" = "public-subnet-us-west-1c"
    }
}

############### Private #############
resource "aws_subnet" "private-us-west-1a" {
    vpc_id = aws_vpc.barret-vpc.id
    cidr_block = "10.45.11.0/24"
    availability_zone = "us-west-1a"
    map_public_ip_on_launch = true

    tags = {
      "Name" = "private-subnet-us-west-1a"
    }
}

resource "aws_subnet" "private-us-west-1c" {
    vpc_id = aws_vpc.barret-vpc.id
    cidr_block = "10.45.13.0/24"
    availability_zone = "us-west-1c"
    map_public_ip_on_launch = true

    tags = {
      "Name" = "private-subnet-us-west-1c"
    }
}