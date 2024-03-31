provider "aws" {
  region = "ca-central-1"
}

resource "aws_instance" "ec2" {
    ami = "ami-0ed90a3b5bde5e371"
    instance_type = "t2.micro"
}

resource "aws_eip" "elastic_eip" {
  instance = aws_instance.ec2.id
}

output "EIP" {
  value = aws_eip.elastic_eip.public_ip
}