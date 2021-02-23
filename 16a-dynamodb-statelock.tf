# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates a dynamodb table
# ---------------------------------------------------------------------------------------------------

# req:
# variables.tf        - var.my-db-read-capacity
# variables.tf        - var.my-db-write-capacity
# variables.tf        - var.my-db-hash-key
# variables.tf        - var.my-db-range-key


resource "aws_dynamodb_table" "my-db-tf-statelock" {
  name            = "my-db-tf-statelock"
  read_capacity   = var.my-db-read-capacity
  write_capacity  = var.my-db-write-capacity
  hash_key        = var.my-db-hash-key
  attribute {
    name          = var.my-db-hash-key
    type          = "S"
  }
}