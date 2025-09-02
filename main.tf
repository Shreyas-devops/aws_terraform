provider "aws" {
  region = "ap-south-1"
}

data "aws_ami" "alinux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.8.20250818.0-kernel-6.1-x86_64"]
  }

  owners = ["137112412989"] # amazon
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.alinux.id
  instance_type = "t2.micro"

  tags = {
    Name = "learn-terraform"
  }
}