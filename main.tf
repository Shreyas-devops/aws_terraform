provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "app_server" {
  ami                     = "ami-0861f4e788f5069dd"
  instance_type           = "t2.micro"
  vpc_security_group_ids  = ["sg-0137a88aa4803802d"]
  user_data               = file("${path.module}/install_docker.sh") 
 

  tags = {
    Name = "MyEc2Instance"
  }

}








