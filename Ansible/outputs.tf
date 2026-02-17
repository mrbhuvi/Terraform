output "master_public_ip" {
  value = aws_instance.master.public_ip
}

output "Worker_public_ips" {
  value = aws_instance.worker[*].public_ip
}

output "test" {
  value = "terraform working"
}
