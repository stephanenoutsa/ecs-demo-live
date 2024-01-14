include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:aws-building-blocks/ecs-cluster.git"
}

inputs = {
  name = "ecs-demo"
  setting = {
    name = "containerInsights"
    value = "enabled"
  }
}
