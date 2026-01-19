provider "aws" {
  region = "ap-south-1"
}

# Security Group for Jenkins
resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins-sg"
  description = "Allow SSH and Jenkins access"

  # SSH
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # 🔴 restrict to your IP later
  }

  # Jenkins UI
  ingress {
    description = "Jenkins UI"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Jenkins Agent
  ingress {
    description = "Jenkins Agent"
    from_port   = 50000
    to_port     = 50000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # internal in prod
  }

  # Outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins-sg"
  }
}

# EC2 Instance

resource "aws_instance" "my_instance" {
  ami                    = "ami-0f5ee92e2d63afc18"
  instance_type          = "t3.micro"
  key_name               = "test1"
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  # Install Jenkins automatically
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install java-openjdk11 -y
              wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
              rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
              yum install jenkins -y
              systemctl enable jenkins
              systemctl start jenkins
              EOF

  tags = {
    Name = "terraform-jenkins-ec2"
  }
}

output "instance_public_ip" {
  value = aws_instance.my_instance.public_ip
}
