# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Blocks public access to s3 bucket. 
# ---------------------------------------------------------------------------------------------------

# req:
# 07a-s3-bucket-backend  - aws_s3_bucket.my-s3-tf-backend-000.id
# 07a-s3-bucket-log      - aws_s3_bucket.my-s3-log-bucket.id


resource "aws_s3_bucket_public_access_block" "my-block-public-access-1" {
  bucket = aws_s3_bucket.my-s3-tf-backend-000.id
  block_public_acls   = true
  block_public_policy = true
}


resource "aws_s3_bucket_public_access_block" "my-block-public-access-2" {
  bucket = aws_s3_bucket.my-s3-tf-backend-logs-000.id
  block_public_acls   = true
  block_public_policy = true
}