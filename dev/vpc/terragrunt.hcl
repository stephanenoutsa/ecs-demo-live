include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:aws-building-blocks/vpc.git"
}

inputs = {
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "vpc-dev"
  enable_dns_hostnames = true
  vpc_tags = {}
}
