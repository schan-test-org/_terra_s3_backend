
############################# DynamoDB : local #######################################
locals {
  terraform_default_dynamodb_hash_key       = "LockID"
  terraform_default_dynamodb_billing_mode   = "PAY_PER_REQUEST"
  terraform_default_dynamodb_attribute_type = "S"
}

############################# DynamoDB : resource #######################################

### DynamoDB table for vpc_subnets
resource "aws_dynamodb_table" "tables" {
  for_each = var.dynamo_table_maps
  name     = each.value["name"]

  hash_key     = local.terraform_default_dynamodb_hash_key
  billing_mode = local.terraform_default_dynamodb_billing_mode

  attribute {
    name = local.terraform_default_dynamodb_hash_key
    type = local.terraform_default_dynamodb_attribute_type
  }

  tags       = merge(local.common_tags, { dy_name = each.value["name"] })
  depends_on = [aws_s3_bucket.s3]
}

############################# DynamoDB : output #######################################

output "dynamo_tables" {
  value = aws_dynamodb_table.tables
}