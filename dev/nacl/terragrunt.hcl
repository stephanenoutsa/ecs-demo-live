include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:aws-building-blocks/nacl.git"
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "public-subnets" {
  config_path = "../public-subnets"
}

inputs = {
  _vpc_id = dependency.vpc.outputs.vpc_id
  nacls = [
    # Public NACL 1
    {
      name   = "public-nacl-1"
      vpc_id = dependency.vpc.outputs.vpc_id
      egress = [
        {
          protocol   = "tcp"
          rule_no    = 100
          action     = "allow"
          cidr_block = "0.0.0.0/0"
          from_port  = 80
          to_port    = 80
        },

        {
          protocol   = "tcp"
          rule_no    = 200
          action     = "allow"
          cidr_block = "0.0.0.0/0"
          from_port  = 443
          to_port    = 443
        },

        // {
        //   protocol   = "tcp"
        //   rule_no    = 300
        //   action     = "allow"
        //   cidr_block = "0.0.0.0/0"
        //   from_port  = 1024
        //   to_port    = 65535
        // }
      ]
      ingress = [
        {
          protocol   = "tcp"
          rule_no    = 100
          action     = "allow"
          cidr_block = "0.0.0.0/0"
          from_port  = 80
          to_port    = 80
        },

        {
          protocol   = "tcp"
          rule_no    = 200
          action     = "allow"
          cidr_block = "0.0.0.0/0"
          from_port  = 443
          to_port    = 443
        },

        // {
        //   protocol   = "tcp"
        //   rule_no    = 300
        //   action     = "allow"
        //   cidr_block = "0.0.0.0/0"
        //   from_port  = 1024
        //   to_port    = 65535
        // }
      ]
      subnet_id = dependency.public-subnets.outputs.public_subnets[0]
      tags      = {}
    },

    # Public NACL 2
    {
      name   = "public-nacl-2"
      vpc_id = dependency.vpc.outputs.vpc_id
      egress = [
        {
          protocol   = "tcp"
          rule_no    = 100
          action     = "allow"
          cidr_block = "0.0.0.0/0"
          from_port  = 80
          to_port    = 80
        },

        {
          protocol   = "tcp"
          rule_no    = 200
          action     = "allow"
          cidr_block = "0.0.0.0/0"
          from_port  = 443
          to_port    = 443
        },

        // {
        //   protocol   = "tcp"
        //   rule_no    = 300
        //   action     = "allow"
        //   cidr_block = "0.0.0.0/0"
        //   from_port  = 1024
        //   to_port    = 65535
        // }
      ]
      ingress = [
        {
          protocol   = "tcp"
          rule_no    = 100
          action     = "allow"
          cidr_block = "0.0.0.0/0"
          from_port  = 80
          to_port    = 80
        },

        {
          protocol   = "tcp"
          rule_no    = 200
          action     = "allow"
          cidr_block = "0.0.0.0/0"
          from_port  = 443
          to_port    = 443
        },

        // {
        //   protocol   = "tcp"
        //   rule_no    = 300
        //   action     = "allow"
        //   cidr_block = "0.0.0.0/0"
        //   from_port  = 1024
        //   to_port    = 65535
        // }
      ]
      subnet_id = dependency.public-subnets.outputs.public_subnets[1]
      tags      = {}
    }
  ]
}
