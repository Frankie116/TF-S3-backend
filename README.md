-----------------------------------------------------------------------------

## Project: TF14-S3-backend

This is the initial configuration to setup a Terraform S3 remote backend.  

The tfstate files will be stored on s3 to enable numerous engineers to update terraform infrastructure

without overwriting each others code.

A dynamodb table is used to implement a state lock each time code is being applied.

Author:  Frank Effrim-Botchey

-----------------------------------------------------------------------------
