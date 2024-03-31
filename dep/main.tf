provider "aws" {
  region = "ca-central-1"
}


resource "aws_instance" "db" {
    ami = "ami-0ed90a3b5bde5e371"
    instance_type = "t2.micro"
}

resource "aws_instance" "web" {
    ami = "ami-0ed90a3b5bde5e371"
    instance_type = "t2.micro"

    depends_on = [ aws_instance.db ]
}