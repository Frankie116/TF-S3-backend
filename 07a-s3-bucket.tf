# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# Creates an s3 bucket & bucket policy to enable lb logs to be stored.  (Delete on destroy)
# ---------------------------------------------------------------------------------------------------

# req:
# 9b-random-string.tf   - random_string.my-random-string.result
# variables.tf          - var.my-project-name
# variables.tf          - var.my-environment


resource "aws_s3_bucket" "my-s3-tf-backend-000" {
    bucket                = "my-s3-tf-backend-000"
    # lifecycle {
    #     prevent_destroy = true
    # }
    versioning {
        enabled = true
    }
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
              sse_algorithm = "AES256"
            }
        }
    }
    tags                = {
    Name                = "my-s3-tf-backend-000"
    Terraform           = "true"
    Project             = var.my-project-name
    Environment         = var.my-environment
  }
}

resource "aws_s3_bucket_policy" "my-s3-bp-tf-backend" {
  bucket               = aws_s3_bucket.my-s3-tf-backend-000.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "MYBUCKETPOLICY",
  "Statement": [
    {
      "Sid": "IPAllow",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::my-s3-tf-backend-000/*",
      "Condition": {
      }
    }
  ]
}
POLICY
}