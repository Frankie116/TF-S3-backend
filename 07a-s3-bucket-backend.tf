# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates an encrypted s3 bucket.
# ---------------------------------------------------------------------------------------------------

# req:
# variables.tf            - var.my-s3-bucket-name
# variables.tf            - var.my-project-name
# variables.tf            - var.my-environment
# variables.tf            - var.kms_key_id


resource "aws_s3_bucket" "my-s3-tf-backend-000" {
  bucket                = var.my-s3-bucket-name
  acl                   = "private"
  versioning {
    enabled             = true
  }
  logging {
    target_bucket       = aws_s3_bucket.my-s3-tf-backend-logs-000.id
    target_prefix       = "log/"
  }
  tags                  = {
    Terraform           = "true"
    Project             = var.my-project-name
    Environment         = var.my-environment
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_key_id
        sse_algorithm     = var.kms_key_id == "" ? "AES256" : "aws:kms"
      }
    }
  }
  lifecycle {
    prevent_destroy = true
  }
}