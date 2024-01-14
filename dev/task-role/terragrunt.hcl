include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:aws-building-blocks/iam-role.git"
}

inputs = {
  principals = [
    {
      type = "Service"
      identifiers = ["ecs.amazonaws.com"]
    }
  ]
  role_name = "ECSTaskTaskRole"
  policy_name = "ECRPermissionsPolicy"
  policy_statements = [
    {
      sid = "ECRPermissions"
      actions = [
        "ecr:BatchCheckLayerAvailability",
        "ecr:BatchGetImage",
        "ecr:DescribeImages",
        "ecr:DescribeImageScanFindings"
        "ecr:DescribeRepositories",
        "ecr:GetAuthorizationToken",
        "ecr:GetDownloadUrlForLayer",
        "ecr:GetLifecyclePolicy",
        "ecr:GetLifecyclePolicyPreview",
        "ecr:GetRepositoryPolicy",
        "ecr:ListImages",
        "ecr:ListTagsForResource",
      ]
      resources = ["*"]
    }
  ]
}
