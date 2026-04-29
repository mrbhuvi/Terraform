output "instance_piblic_ip" {
  value = aws_instance.cicd_master.public_ip
}