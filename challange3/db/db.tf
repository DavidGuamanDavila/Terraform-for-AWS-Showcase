resource "aws_instance" "db" {
    ami = "ami-0ed90a3b5bde5e371"
    instance_type = "t2.micro"

    tags = {
        Name = "DB Server"
    }
}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}