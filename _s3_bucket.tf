
############################# S3 : local #######################################
locals {
  s3_bucket_name = format("%s-%s", var.s3_bucket_name, random_string.s3_suffix.result)

}

############################# S3 : resource #######################################

resource "random_string" "s3_suffix" {
  length  = var.suffixnum
  special = false
  upper   = false
}

resource "aws_s3_bucket" "s3" {
  count  = var.create_s3_bucket ? 1 : 0
  bucket = local.s3_bucket_name

  tags = merge(
    local.common_tags, { "s3-name" = local.s3_bucket_name }
  )

  force_destroy = true
}

# Enable s3 bucket versioning 
# Notice: Once enabled, it cannot be disabled. It just turns into `Suspended`.
resource "aws_s3_bucket_versioning" "s3" {
  bucket = var.create_s3_bucket ? aws_s3_bucket.s3[0].id : var.s3_bucket_name
  versioning_configuration { status = "Enabled" }
}

############################# S3 : output #######################################

output "s3_bucket_name" {
  value = var.create_s3_bucket ? aws_s3_bucket.s3[0].bucket : var.s3_bucket_name
}