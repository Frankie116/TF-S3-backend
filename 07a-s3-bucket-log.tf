# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates an s3 bucket & bucket policy to enable lb logs to be stored.  (Delete on destroy)
# ---------------------------------------------------------------------------------------------------

# req:
# 30a-random-string.tf   - random_string.my-random-string.result
# variables.tf           - var.my-project-name
# variables.tf           - var.my-environment


resource "aws_s3_bucket" "my-s3-tf-backend-logs-000" {
  bucket                 = "my-s3-tf-backend-logs-000"
  acl                    = "log-delivery-write"
  force_destroy          = false
  versioning {
    enabled              = true
  }
    tags                 = {
    Name                 = "my-s3-tf-backend-logs-000"
    Terraform            = "true"
    Project              = var.my-project-name
    Environment          = var.my-environment
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_key_id
        sse_algorithm     = var.kms_key_id == "" ? "AES256" : "aws:kms"
      }
    }
  }
}