provider "aws" {
  region = "ap-south-1"  # change if needed
}

# Existing Security Group (Jenkins SG)
variable "jenkins_sg_id" {
  default = "sg-08c8a85969afcc509"
}

# Key pair name already created in AWS
variable "key_name" {
  default = "test1"  # CHANGE THIS
}

resource "aws_instance" "jenkins_ec2" {
  ami           = "ami-0f58b397bc5c1f2e8"  # Ubuntu 22.04 (ap-south-1)
  instance_type = "t3.small"
  key_name      = var.key_name

  vpc_security_group_ids = [var.jenkins_sg_id]

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  tags = {
    Name = "Jenkins-Server"
  }
}

output "jenkins_public_ip" {
  value = aws_instance.jenkins_ec2.public_ip
}
