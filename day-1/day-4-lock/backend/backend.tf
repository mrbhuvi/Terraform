
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "terraform-lock-bucket-bhuvi-2026"
}

resource "aws_dynamodb_table" "dyanmodb" {
  name         = "basic-dynamodb-table-2026"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}