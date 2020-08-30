resource "aws_iam_role" "ecs_task_execution" {
  name               = "ecs-task-execution-${var.environment}"
  path               = "/"
  assume_role_policy = file("${path.module}/aws_iam_policies/ecs_tasks_assume_role_policy.json")
}

resource "aws_iam_role" "fargate_ssm" {
  name               = "fargate-ssm-${var.environment}"
  path               = "/"
  assume_role_policy = file("${path.module}/aws_iam_policies/fargate_ssm_ecs_tasks_assume_role_policy.json")
}
