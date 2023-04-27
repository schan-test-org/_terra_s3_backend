############################# main : var #######################################
variable "env" { type = string }
variable "aws_profile" { type = string }
variable "aws_region" { type = string }
variable "project" { type = string }
variable "default_tags" { type = map(string) }

# variable "suffixnum" { type = number }

############################# S3 : var #######################################
variable "create_s3_bucket" { type = bool }
variable "s3_bucket_name" { type = string }
variable "suffixnum" { type = string }
# variable "s3_bucketprefix_in" { type        = string }

############################# DynamoDB : var #######################################
variable "dynamo_table_maps" {}


