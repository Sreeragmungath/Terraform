provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Ubuntu-VM" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  # not providing any vpc so that it will take default vpc
  # not providing any subnet id so that it will take default subnet
  tags = {
    Name = "ubuntu-vm"
  }
}
