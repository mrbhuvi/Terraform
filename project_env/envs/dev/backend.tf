terraform {
  backend "s3" {
    bucket         = "my-terraform-s3-bucket-lock-bhuvi"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table-bhuvi"
  }
}