
############################# main : local #######################################
locals {
  common_tags = merge(var.default_tags, {
    "project" = var.project
    "env"     = var.env
    "managed" = "terraform"
    "region"  = var.aws_region
  })
}

############################# main : resource #######################################

# resource "random_string" "suffix_num" {
#   length  = var.suffixnum
#   special = false
#   upper   = false
# }