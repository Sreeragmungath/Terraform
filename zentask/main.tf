terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">=1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "terraform_vpc" {
  cidr_block = "10.0.0.0/16"
    tags = {
      Name = "terraform-VPC"
  }
}

resource "aws_subnet" "tf_subnet1" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-subnet1"
  }
}

resource "aws_subnet" "tf_subnet2" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "tf-subnet2"
  }
}

resource "aws_subnet" "tf_subnet3" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "tf-subnet3"
  }
}

resource "aws_instance" "tf_ubuntu1" {
  ami           = "ami-0c7217cdde317cfec"  
  instance_type = "t2.micro"      
  subnet_id     = aws_subnet.tf_subnet1.id
  tags = {
    Name = "tf-ubuntu1"
  }
}

resource "aws_instance" "tf_ubuntu2" {
  ami           = "ami-0c7217cdde317cfec"  
  instance_type = "t2.micro"      
  subnet_id     = aws_subnet.tf_subnet2.id
  tags = {
    Name = "tf-ubuntu2"
  }
}
