output "ecr_repository" {
  value = {
    fargate_ssm = aws_ecr_repository.fargate_ssm
  }
}
