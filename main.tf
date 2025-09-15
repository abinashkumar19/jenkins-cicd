provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "dev" {
  ami           = "ami-0a94a1259c5779e00"
  instance_type = "t2.micro"

  # Place instance in specific subnet
  subnet_id = "subnet-08272067059a27d89"

  # Attach to a security group (required when subnet is specified)
  vpc_security_group_ids = [aws_security_group.dev_sg.id]

  tags = {
    Name = "webhook"
  }
}

# Security group in your chosen VPC
resource "aws_security_group" "dev_sg" {
  name        = "dev-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = "vpc-0bc7076e28eefb745"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
