include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:aws-building-blocks/ecs-service.git"
}

dependency "ecs_cluster" {
  config_path = "../ecs-cluster"
}

dependency "ecs_task_definition" {
  config_path = "../ecs-task-definition"
}

dependency "public_subnets" {
  config_path = "../public-subnets"
}

dependency "security_group" {
  config_path = "../security-group"
}

inputs = {
  name = "ecs-demo-service"
  cluster_arn = dependency.ecs_cluster.outputs.arn
  task_definition_arn = dependency.ecs_task_definition.outputs.arn
  desired_count = 2
  launch_type = "FARGATE"
  force_new_deployment = true
  network_configuration = {
    subnets = [dependency.public_subnets.outputs.public_subnets[0]]
    security_groups = [dependency.security_group.outputs.security_group_id]
    assign_public_ip = true
  }
}
