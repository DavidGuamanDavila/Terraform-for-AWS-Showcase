provider "aws" {
    region = "ca-central-1"
}

variable "vpcname" {
    type = string
    default = "myvpc"
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
    default = true
}

variable "mylist" {
  type = list(string)
  default = [ "Value1", "Value2" ]
}

variable "mymap" {
  type = map
  default = {
    Key1 = "Value1"
    Key2 = "Value2"
  }
}

resource "aws_vpc" "myvpc"{
    cidr_block = "10.0.0.0/16"

    tags = {
        NAME = var.vpcname
    }
}