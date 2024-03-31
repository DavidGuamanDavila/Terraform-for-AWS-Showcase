resource "aws_instance" "web" {
    ami = "ami-0ed90a3b5bde5e371"
    instance_type = "t2.micro"
    security_groups = [module.sg.sg_name]
   #user_data = file("server-script.sh") # Read the contents of the file
    tags = {
        Name = "Web Server"
    }
}

output "pub_ip" {
  value = module.eip.PublicIP
}

module "eip" {
  source = "../eip"
  instance_id = aws_instance.web.id
}

module "sg" {
  source = "../sg"
}




