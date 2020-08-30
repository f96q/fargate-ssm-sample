resource "aws_ecr_repository" "fargate_ssm" {
  name = "fargate-ssm-${var.environment}"
}
