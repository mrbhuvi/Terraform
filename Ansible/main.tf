provider "aws" {
  region = "ap-south-1"
}


# ---------------- MASTER NODE ----------------
resource "aws_instance" "master" {
    ami = var.ami_id
    instance_type = var.master_instance_type
    key_name = var.key_name
    vpc_security_group_ids = [var.security_group_id]

    tags = {
        Name = "Ansible-Master"
        Role="master"
    }
  
}

# ---------------- Worker NODE ----------------

resource "aws_instance" "worker" {
    count = var.worker_count
    ami = var.ami_id
    instance_type = "t3.micro"
    key_name = var.key_name
    vpc_security_group_ids = [var.security_group_id]

    tags = {
        Name = "Ansible-Worker-${count.index + 1}"
        Role="worker"
    }

  
}