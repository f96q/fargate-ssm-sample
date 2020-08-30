resource "aws_cloudwatch_log_group" "fargate_ssm" {
  name = "fargate-ssm-${var.environment}"
}
