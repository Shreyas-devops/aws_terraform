provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "my_key_pair" {
  key_name   = "myvmpublickey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDKPWQrWfhG7mERSvofpgZ/06kyIXeF7uWO/VHnQJnzD3AkTS+yWpIDxpRnLJEVNc0JiwpoSKF/ci+1yLPVbqrX9/lvBqZfybvPFMqNZTaabhAGMxX3G/SiXAwq517U1F2Von8hYhXIoIlEnhwSmFYK/wZFzsoKR8uoo1vLSaY9QqiA9OwlAKV1l2xX9UaGCHnhsr4ejAWb2pjOHX8ClICbgwEr2ATNkRo98vkKGPt5TjwKGhUgKVsVx7kx1k+TKam5GgpjQouj3YJteB0rI/kawMas1DOMNCuYq4dnggYYflOajaml1mMYPP3BXMJeOFZMlKbbIwT9nWnab6867bYhg2UY2oLzYV8MzT1IuXmQG05yIwDfb6lEE/SsQuQUMAOj1LMn85bps+nM+eamrdUGFcbeyF5nk+liweJcetliVsHvLehBQu1w9C60kJMtDlfEVYBwq1nsCeh/5YPe24TpOwdAsZa9CFvw2B10/I03orxGchnIKPb3fS2wzBBPrH0= osboxes@ansiblecontroller"
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

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.docker_vm.public_ip
}

/*resource "aws_instance" "minikube_vm" {
  ami                     = "ami-0861f4e788f5069dd"
  instance_type           = "t2.medium"
  vpc_security_group_ids  = ["sg-0137a88aa4803802d"]
  user_data               = file("${path.module}/install_minikube.sh") 
 

  tags = {
    Name = "MyMinikubeVM"
  }

}
*/








