include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:aws-building-blocks/ecs-task-definition.git"
}

dependency "task_role" {
  config_path = "../task-role"
}

inputs = {
  family = "ecs-demo-task-definition"
  container_definitions_path = "./container-definitions.json"
  network_mode = "awsvpc"
  compatibilities = ["FARGATE"]
  cpu = 512
  memory = 2048
  task_role_arn = dependency.task_role.outputs.role_arn
  execution_role_arn = dependency.task_role.outputs.role_arn
}
