output "subnet" {
  value = {
    default = [
      aws_default_subnet.default_1,
      aws_default_subnet.default_2
    ]
  }
}

output "security_group" {
  value = {
    fargate_ssm = aws_security_group.fargate_ssm
  }
}
