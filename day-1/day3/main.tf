provider "aws" {
  region = "ap-south-1"
}


resource "aws_key_pair" "my_key-pair" { 
  key_name   = "my_key-pair"
  public_key = file("${path.module}/terraform-in-shot.pub")
}


resource "aws_default_vpc" "default" {
  
}


resource "aws_security_group" "security_group" {
    name="terraform_security_group"
    vpc_id=aws_default_vpc.default.id
    description="Allow SSH and HTTP traffic"
  
}




# Inbound & Outbount port rules

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
    security_group_id = aws_security_group.security_group.id
    ip_protocol          = "tcp"
    from_port        = 80
    to_port          = 80
    cidr_ipv4        = "0.0.0.0/0"
  
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
    security_group_id = aws_security_group.security_group.id
    ip_protocol          = "tcp"
    from_port        = 22
    to_port          = 22
    cidr_ipv4 = "0.0.0.0/0"
  
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
    security_group_id = aws_security_group.security_group.id
    ip_protocol          = "-1"
    cidr_ipv4 = "0.0.0.0/0"
  
}



#EC2 instance


resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.my_key-pair.key_name
  security_groups = [aws_security_group.security_group.name]
  
  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  tags = {
    Name = "terra-automate-server"
  }
}