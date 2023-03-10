provider "aws" {
	  profile = "default"
	  region  = "us-east-1"
	}

	data "aws_ami" "ubuntu" {
	  most_recent = true

	  filter {
	    name   = "name"
	    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
	  }

	  filter {
	    name   = "virtualization-type"
	    values = ["hvm"]
	  }

	  owners = ["099720109477"]
	}

	resource "aws_instance" "jenkins" {
	  ami           = data.aws_ami.ubuntu.id
	  instance_type = "t2.micro"

	  tags = {
	    "Name"      = "Jenkins_Server"
	    "Terraform" = "true"
	  }
	}
