include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:aws-building-blocks/internet-gateway.git"
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  vpc_id = dependency.vpc.outputs.vpc_id
  name = "igw-dev"
  tags = {}
}
