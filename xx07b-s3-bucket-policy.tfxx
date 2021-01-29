





resource "aws_s3_bucket_policy" "my-s3-bp-tf-state-lock" {
  bucket = aws_s3_bucket.my-s3-tf-backend-000.id
  policy = data.aws_iam_policy_document.my-iam-pd-tf-state-lock.json
}

