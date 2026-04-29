provider "aws" {
  region = var.region
}

resource "aws_instance" "cicd_master" {
    ami           = "ami-02b8269d5e85954ef"
    instance_type = var.instance_type
    key_name      = var.key_name
    
    root_block_device {
        volume_size = var.volume_size
        volume_type = "gp3"
    }
    
    tags = {
        Name = "cicd_master"
    }
}