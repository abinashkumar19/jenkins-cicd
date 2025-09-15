provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "dev" {
    ami = "ami-0a94a1259c5779e00"
    instance_type = "t2.micro"
    tags = {
      Name = "webhook"
    }
}
