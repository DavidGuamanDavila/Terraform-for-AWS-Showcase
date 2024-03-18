provider "aws" {
  region = "ca-central-1"
}

resource "aws_instance" "ec2" {
    ami = "ami-0ed90a3b5bde5e371"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.webtraffic.name]
}

resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"

  ingress = {
    from_port = 443 # Here you can configure a range of ports
    to_port = 443
    protocol = "TCP"
    cidr = ["0.0.0.0/0"] 
  }

  egress = {
    from_port = 443 # Here you can configure a range of ports
    to_port = 443
    protocol = "TCP"
    cidr = ["0.0.0.0/0"] 
  }
}