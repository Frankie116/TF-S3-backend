# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# outputs
# ---------------------------------------------------------------------------------------------------

# req:
# None

output "my-s3-bucket" {
  value = aws_s3_bucket.my-s3-tf-backend-000.id
}

output "my-db-tf-statelock" {
  value = aws_dynamodb_table.my-db-tf-statelock.id
}


