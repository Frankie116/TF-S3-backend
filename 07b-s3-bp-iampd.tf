# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates an s3 bucket policy to enable access to the s3 bucket. 
# ---------------------------------------------------------------------------------------------------

# req:
# 07a-s3-bucket-backend  - aws_s3_bucket.my-s3-tf-backend-000.id
# 08b-iampd-statelock   - data.aws_iam_policy_document.my-iam-pd-tf-statelock.json


resource "aws_s3_bucket_policy" "my-s3-bp-tf-statelock" {
  bucket                 = aws_s3_bucket.my-s3-tf-backend-000.id
  policy                 = data.aws_iam_policy_document.my-iampd-tf-statelock.json
}

resource "aws_s3_bucket_policy" "my-s3-bp-tf-statelock-logs" {
  bucket              = aws_s3_bucket.my-s3-tf-backend-logs-000.id
  policy              = data.aws_iam_policy_document.my-iampd-tf-statelock-logs.json
}