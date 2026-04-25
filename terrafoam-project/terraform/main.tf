provider "aws" {
  region = "eu-north-1"
}

# 🔍 Get latest Ubuntu
data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# 🔐 Security group (open ports)
resource "aws_security_group" "web_sg" {
  name = "terraform-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 🚀 EC2 instance + deploy your app automatically
resource "aws_instance" "my_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  security_groups = [aws_security_group.web_sg.name]

  user_data = <<-EOF
#!/bin/bash

apt update -y
apt install -y docker.io git

systemctl start docker
systemctl enable docker

cd /home/ubuntu

git clone https://github.com/eaziguy/devops-project.git app

cd app

docker build -t myapp .

docker run -d -p 80:3000 myapp

EOF

  tags = {
    Name = "Terraform-App-Server"
  }
}
