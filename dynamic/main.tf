provider "aws" {
  region = "ca-central-1"
}

variable "ingressrules" {
  type = list(number)
  default = [ 80, 433]
}

variable "egressrules" {
  type = list(number)
  default = [ 80, 433, 25, 3306, 53, 8080]
}

resource "aws_instance" "ec2" {
    ami = "ami-0ed90a3b5bde5e371"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.webtraffic.name]
}

resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content{
      from_port = port.value # Here you can configure a range of ports
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"] 
    }

  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content{
      from_port = port.value # Here you can configure a range of ports
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"] 
    }

  }
}