# Input variable definitions

variable "region" {
    default = "eu-west-2"
}

variable my-project-name {
  description           = "Name of the project. Used in resource names and tags."
  type                  = string
  default               = "default1"
}  

variable my-environment {
  description           = "Value of the 'Environment' tag."
  type                  = string
  default               = "dev"
}

# 16a-dynamodb-table.tf -------------------------------------------------------
variable "my-db-tablename" {
  type    = string
  default = "my-statelock"
}

 variable "my-db-hash-key" {
   type    = string
    default = "LockID"
}

variable "my-db-read-capacity" {
  type    = number
  default = 1
}

variable "my-db-write-capacity" {
  type    = number
  default = 1
}


# 08b-iam-policy-doc.tf -------------------------------------------------------
variable "kms_key_id" {
  # Default to absent/blank to use the default aws/s3 aws kms master key
  default     = ""
  description = "The AWS KMS master key ID used for the SSE-KMS encryption on the tf state s3 bucket. If the kms_key_id is specified, the bucket default encryption key management method will be set to aws-kms. If the kms_key_id is not specified (the default), then the default encryption key management method will be set to aes-256 (also known as aws-s3 key management). The default aws/s3 AWS KMS master key is used if this element is absent (the default)."
}

