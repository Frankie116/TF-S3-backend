# Input variable definitions

variable "my-aws-region" {
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


# 07a-s3-bucket.tf -------------------------------------------------------
variable "my-s3-bucket-name" {
  type    = string
  default = "my-s3-tf-backend-000"
}


# 16a-dynamodb-statelock.tf -------------------------------------------------------
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
}

