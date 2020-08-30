module "vpc" {
  source                 = "../../modules/vpc"
  environment            = var.environment
  aws_region             = data.aws_region.current.name
  aws_availability_zones = data.aws_availability_zones.current
}

module "cloudwatch" {
  source      = "../../modules/cloudwatch"
  environment = var.environment
}

module "iam" {
  source         = "../../modules/iam"
  environment    = var.environment
  aws_account_id = data.aws_caller_identity.current.account_id
}

module "ecr" {
  source      = "../../modules/ecr"
  environment = var.environment
  aws_region  = data.aws_region.current.name
}

module "ecs" {
  source             = "../../modules/ecs"
  environment        = var.environment
  aws_region         = data.aws_region.current.name
  execution_role_arn = module.iam.iam_role.ecs_task_execution.arn
  fargate_ssm = {
    security_group_id = module.vpc.security_group.fargate_ssm.id
    subnet_ids        = module.vpc.subnet.default[*].id
    cpu               = 256
    memory            = 512
    task_role_arn     = module.iam.iam_role.fargate_ssm.arn
    image             = module.ecr.ecr_repository.fargate_ssm.repository_url
    awslogs_group     = module.cloudwatch.cloudwatch_log_group.fargate_ssm.id
  }
}
