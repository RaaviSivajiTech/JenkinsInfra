provider "aws" {
  region = "us-east-2"  
}

resource "aws_instance" "aws-jenkins-ec2" {
  ami = "ami-02d7fd1c2af6eead0"
  instance_type = "t2.micro"
  vpc_security_group_ids = "sg-0e243d83b5b1e420c"
  tags = {
    Name = "Jenkins_Server"
  }

user_data = <<-EOF
#!bin/bash
    sudo yum update -y
    sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
    sudo yum upgrade
    sudo amazon-linux-extras install java-openjdk11 -y
    sudo dnf install java-11-amazon-corretto -y
    sudo yum install jenkins -y
    sudo systemctl enable jenkins
    sudo systemctl start jenkins
  EOF
}

