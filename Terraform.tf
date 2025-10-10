provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami             = "ami-052064a798f08f0d3"
  instance_type   = "t3.micro"
  key_name        = "Terraform"
  security_groups = ["Default"]
  subnet_id       = "subnet-0018dd2513736a2ba"
  
  user_data = <<-EOF
    #!/bin/bash
    
    # Update package repositories
    apt-get update -y
    
    # Install nginx
    apt-get install nginx -y
    
    # Start nginx service
    systemctl start nginx
    
    # Enable nginx to start on boot
    systemctl enable nginx
  EOF
}