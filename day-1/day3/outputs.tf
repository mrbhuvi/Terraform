output "ec2_public_ip" {
  description = "Public IP adress"
  value = aws_instance.ec2_instance.public_ip
}