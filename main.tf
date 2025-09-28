provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "my_key_pair" {
  key_name   = "myvmpublickey"
  public_key = file("${path.module}/sshkey.pub") 
}

resource "aws_instance" "docker_vm" {
  ami                     = "ami-0861f4e788f5069dd"
  instance_type           = "t2.micro"
  key_name                = aws_key_pair.my_key_pair.key_name
  vpc_security_group_ids  = ["sg-0137a88aa4803802d"]
  user_data               = file("${path.module}/install_docker.sh") 
 

  tags = {
    Name = "MyDockerVM"
  }

}


resource "aws_instance" "minikube_vm" {
  ami                     = "ami-0861f4e788f5069dd"
  instance_type           = "t2.medium"
  key_name                = aws_key_pair.my_key_pair.key_name
  vpc_security_group_ids  = ["sg-0137a88aa4803802d"]
  user_data               = file("${path.module}/install_minikube.sh") 
 

  tags = {
    Name = "MyMinikubeVM"
  }

}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.docker_vm.public_ip
}

output "instance_public_ip2" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.minikube_vm.public_ip
}












