provider "aws" {
  region = "ca-central-1"
}

resource "aws_vpc" "challange1vpc" {
    cidr_block = "192.168.0.0/24"  
    tags = {
      Name = "TerraformVPC"
    }
}