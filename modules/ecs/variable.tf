variable "environment" {}

variable "aws_region" {}

variable "execution_role_arn" {}

variable "fargate_ssm" {
  type = object({
    security_group_id = string
    subnet_ids        = list(string)
    cpu               = number
    memory            = number
    task_role_arn     = string
    image             = string
    awslogs_group     = string
  })
}
