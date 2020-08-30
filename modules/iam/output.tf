output "iam_role" {
  value = {
    ecs_task_execution = aws_iam_role.ecs_task_execution
    fargate_ssm        = aws_iam_role.fargate_ssm
  }
}
