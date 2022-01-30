terraform {
  required_providers {
        azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
  cloud {
    organization = "AkerBP"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}


#AWS
provider "aws" {
  region = "eu-central-1"
}



resource "random_pet" "sg" {}

resource "aws_instance" "web" {
  ami                    = "ami-4e013753"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web-sg.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
}


