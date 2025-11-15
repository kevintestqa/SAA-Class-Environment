resource "aws_internet_gateway" "kalm-igw" {
    vpc_id = aws_vpc.barret-vpc.id

    tags = {
      "Name" = "kalm-igw"
    }
}