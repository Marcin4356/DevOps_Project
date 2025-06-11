provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "demo-server" {
  ami = "ami-006b4a3ad5f56fbd6"
  instance_type = "t3.micro"
  key_name = "MAIN"
  security_groups = [ "demo-sg" ]
  
}

resource "aws_security_group" "demo-sg" {
  name        = "demo-sh"
  description = "SSH Access"

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh"
  }
}

resource "aws_instance" "demo-server" {
  ami                    = "ami-006b4a3ad5f56fbd6"
  instance_type          = "t3.micro"
  key_name               = "MAIN"
  vpc_security_group_ids = [aws_security_group.demo-sg.id]
}
