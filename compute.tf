# This is the data source configuration for fetching the latest Ubuntu AMI in the us-east-1 region.
data "aws_ami" "ubuntu" {

  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

# This is how you configure a data source to fetch the latest Ubuntu AMI in a separate region.
data "aws_ami" "ubuntu_us_west" {

  most_recent = true
  owners      = ["099720109477"]
  provider    = aws.us_west

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

data "aws_caller_identity" "current_caller" {
  
}

data "aws_region" "current_region" {
  
}

# This output will show the latest Ubuntu AMI ID in the us-east-1 region.
output "ubuntu_ami_data_us_east" {
  value = data.aws_ami.ubuntu.id
}

# This output will show the latest Ubuntu AMI ID in the us-west-1 region.
output "ubuntu_ami_data_us_west" {
  value = data.aws_ami.ubuntu_us_west.id
}

resource "aws_instance" "web" {
  # AMI ID NGINX - ami-010e099e651d8635e
  ami                         = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp2"
  }
}