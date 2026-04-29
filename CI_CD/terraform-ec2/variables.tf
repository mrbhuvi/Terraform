variable "region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "volume_size" {
  default = 15
}

variable "key_name" {
  description = "EC2 key pair"
}