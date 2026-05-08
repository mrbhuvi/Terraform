provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = "my-terraform-s3-bucket-lock-bhuvi"
    
  
}

resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.s3_bucket.id
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_dynamodb_table" "dynamodb_table" {
    name         = "terraform-lock-table-bhuvi"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
  
}