resource "aws_ecs_cluster" "fargate_ssm" {
  name = "fargate-ssm-${var.environment}"
}
