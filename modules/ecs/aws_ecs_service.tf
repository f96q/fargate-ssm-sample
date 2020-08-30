resource "aws_ecs_service" "fargate_ssm" {
  name             = "fargate-ssm-${var.environment}"
  cluster          = aws_ecs_cluster.fargate_ssm.id
  task_definition  = aws_ecs_task_definition.fargate_ssm.arn
  desired_count    = 1
  launch_type      = "FARGATE"
  platform_version = "1.4.0"

  network_configuration {
    assign_public_ip = true
    security_groups  = [var.fargate_ssm.security_group_id]
    subnets          = var.fargate_ssm.subnet_ids
  }
}
