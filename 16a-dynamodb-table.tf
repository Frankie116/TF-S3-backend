
# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# Creates a vpc
# ---------------------------------------------------------------------------------------------------

# req:
# 9b-random-string.tf - random_string.my-random-string.result
# variables.tf        - my-db-tablename
# variables.tf        - var.my-db-read-capacity
# variables.tf        - var.my-db-write-capacity
# variables.tf        - var.my-db-hash-key
# variables.tf        - var.my-db-range-key



resource "aws_dynamodb_table" "my-db-tf-state-lock" {
  name            = "my-db-tf-state-lock"
  # billing_mode = "PAY_PER_REQUEST"
  read_capacity   = var.my-db-read-capacity
  write_capacity  = var.my-db-write-capacity
  hash_key        = var.my-db-hash-key
  attribute {
    name          = var.my-db-hash-key
    type          = "S"
  }
}


