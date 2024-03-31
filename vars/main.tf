provider "aws" {
  region = "ca-central-1"
}

variable "number_of_servers" {
  type = number
}


resource "aws_instance" "ec2" {
    ami = "ami-0ed90a3b5bde5e371"
    instance_type = "t2.micro"
    count = var.number_of_servers
}