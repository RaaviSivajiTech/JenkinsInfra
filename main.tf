provider "aws" {
  region = "us-east-1"  
}

resource "aws_instance" "aws-jenkins-ec2" {
  ami = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  
  tags = {
    Name = "Jenkins_Server"
  }
  key_name = "sirisha"
  metadata_options {
    http_tokens = "required"
  } 
}

