resource "aws_security_group" "fargate_ssm" {
  name   = "fargate-ssm-${var.environment}"
  vpc_id = aws_default_vpc.default.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
