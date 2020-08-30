output "cloudwatch_log_group" {
  value = {
    fargate_ssm = aws_cloudwatch_log_group.fargate_ssm
  }
}
