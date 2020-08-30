resource "aws_iam_role_policy" "fargate_ssm" {
  name = "fargate-ssm-${var.environment}"
  role = aws_iam_role.fargate_ssm.id
  policy = templatefile("${path.module}/aws_iam_role_policies/fargate_ssm.json.tpl",
    {
      aws_account_id = var.aws_account_id
    }
  )
}
