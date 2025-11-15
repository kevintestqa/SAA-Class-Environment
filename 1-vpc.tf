resource "aws_vpc" "barret-vpc" {
    cidr_block = "10.45.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
      "Name" = "barret-vpc"
    }
}