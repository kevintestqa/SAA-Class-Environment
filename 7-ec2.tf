resource "aws_instance" "barret-ec2" {
    ami = "ami-0e6be795b21969e1d" #us-west-1
    associate_public_ip_address = true
    instance_type = "t3.micro"
    subnet_id = aws_subnet.public-us-west-1a.id
 
    security_groups = [ aws_security_group.barret-sg.id]

    user_data = file("user_data.sh")

    tags = {
      "Name" = "barret-ec2"
    }
}