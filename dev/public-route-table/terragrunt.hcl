include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:aws-building-blocks/route-table.git"
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "igw" {
  config_path = "../internet-gateway"
}

inputs = {
  route_tables = [
    {
      name      = "public-rt-dev"
      vpc_id    = dependency.vpc.outputs.vpc_id
      is_igw_rt = true

      routes = [
        {
          cidr_block = "0.0.0.0/0"
          igw_id     = dependency.igw.outputs.igw_id
        }
      ]

      tags = {}
    }
  ]
}
