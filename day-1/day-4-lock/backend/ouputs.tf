output "s3_bucket" {
  value = aws_s3_bucket.s3_bucket.id
}


output "dyanmodb" {
  value = aws_dynamodb_table.dyanmodb.name
}