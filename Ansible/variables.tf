variable "region" {
  default = "ap-south-1"
}

variable "ami_id" {
    description = "AMI ID for the instances"
    type        = string
    default = "ami-02b8269d5e85954ef"
  
}


variable "master_instance_type" {
    description = "Instance type for the master node"
    type        = string
    default = "t3.small"
  
}
variable "key_name" {
    description = "Key pair name for SSH access"
    type        = string
    default = "test1"
  
}

variable "security_group_id" {
    description = "Security Group ID for the instances"
    type        = string
    default = "sg-07b7d0c977c89ea55"
  
}

variable "worker_count" {
    description = "Number of worker nodes to create"
    type        = number
    default = 3
  
}