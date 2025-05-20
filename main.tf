# main.tf
provider "aws" {
  region = var.region
}

resource "aws_instance" "devsecops" {
  ami                    = "ami-0f58b397bc5c1f2e8"
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data              = file("user_data.sh")

  tags = {
    Name = "DevSecOps-Jenkins"
  }
}
