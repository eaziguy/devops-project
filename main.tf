provider "aws" {
  region = "eu-north-1"
}

# This block automatically finds the latest Ubuntu 24.04 AMI in Stockholm
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Official Canonical ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

resource "aws_instance" "my_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro" # Note: t3 is more common/cheaper than t2 in Stockholm
}
