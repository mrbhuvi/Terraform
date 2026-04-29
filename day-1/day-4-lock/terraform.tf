terraform {
  backend "s3" {
    bucket = "terraform-lock-bucket-bhuvi-2026"
    key = "backend/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table =  "basic-dynamodb-table-2026"
    
  }
}