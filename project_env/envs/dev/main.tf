provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "project_key" { 
  key_name   = "project_key"
  public_key = file("../../project_key.pub")
}


module "ec2" {
  source = "../../modules/ec2"

    ami_id = "ami-02b8269d5e85954ef"
    instance_type = "t3.micro"
    env = "dev"
    instance_count = 1
    key_name = aws_key_pair.project_key.key_name

}