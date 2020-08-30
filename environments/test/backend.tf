terraform {
  backend "s3" {
    bucket  = "fargate-ssm-terraform"
    key     = "test/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "fargate-ssm-terraform"
  }
}
