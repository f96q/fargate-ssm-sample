resource "aws_ecs_task_definition" "fargate_ssm" {
  family                   = "fargate-ssm-${var.environment}"
  cpu                      = var.fargate_ssm.cpu
  memory                   = var.fargate_ssm.memory
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = var.fargate_ssm.task_role_arn
  execution_role_arn       = var.execution_role_arn
  container_definitions = templatefile("${path.module}/aws_ecs_task_definitions/fargate_ssm.json.tpl",
    {
      image         = var.fargate_ssm.image
      aws_region    = var.aws_region
      environment   = var.environment
      awslogs_group = var.fargate_ssm.awslogs_group
    }
  )
}
