provider "aws" {
  region = "ap-south-1"
}

#  import {
#     id = "i-00576c6cf184f535e"
#     to = aws_instance.my_instance
#  }

 resource "aws_instance" "my_instance" {
  ami                                  = "ami-02b8269d5e85954ef"
  associate_public_ip_address          = false
  availability_zone                    = "ap-south-1b"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = true
  force_destroy                        = false
  get_password_data                    = false
  hibernation                          = false
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.small"
  ipv6_address_count                   = 0
  ipv6_addresses                       = []
  key_name                             = "test1"
  monitoring                           = false
  placement_partition_number           = 0
  private_ip                           = "172.31.15.83"
  region                               = "ap-south-1"
  secondary_private_ips                = []
  security_groups                      = ["launch-wizard-1"]
  source_dest_check                    = true
  subnet_id                            = "subnet-0f0edec8666b5c69e"
  tags = {
    Name = "test1"
  }
  tags_all = {
    Name = "test1"
  }
  tenancy                     = "default"
  user_data                   = null
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-07b7d0c977c89ea55"]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    core_count       = 1
    threads_per_core = 2
  }
  credit_specification {
    cpu_credits = "unlimited"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  primary_network_interface {
    network_interface_id = "eni-0eec8d04069db63d2"
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
}
