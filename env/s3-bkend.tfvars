########################################
# Common
########################################
aws_region  = "ap-northeast-2"
aws_profile = "mz"
project     = "dev-test"

########################################
# wks = env
########################################
env = "mz-dev"

########################################
# tags & etc.
########################################
default_tags = {
  dept  = "Platform Service Architect Group / DevOps SWAT Team"
  email = "schan@mz.co.kr"
}

########################################
# conditions & others
########################################
# create_s3_bucket = false
create_s3_bucket = true
suffixnum        = 4


########################################
# s3 about
########################################
s3_bucket_name = "terra-state"


########################################
# dynamo about
########################################
dynamo_table_maps = {
  infra_vpc = {
    name = "infra-vpc"
  }
  infra_network = {
    name = "infra-network"
  }
  eks = {
    name = "eks"
  }
  ebs = {
    name = "ebs-csi-driver"
  }
  alb = {
    name = "aws-load-balancer-controller"
  }
  # external_dns = {
  #   name = "external-dns"
  # }
  ingress_nginx = {
    name = "ingress-nginx"
  }
}
