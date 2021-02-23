# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# provider details
# ---------------------------------------------------------------------------------------------------

# req:
# # variables.tf           - var.my-aws-region

provider "aws" {
  region = var.my-aws-region
}