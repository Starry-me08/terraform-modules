terraform {
  backend "s3" {
    bucket         = "ola32-dev-99"
    key            = "ec2/terraform.tfstate"
    dynamodb_table = "terraform-remote-state-dynamo"
    region         = "us-west-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = "~> 1.0"
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket         = "ola32-dev-99"
    key            = "terraform/terraform.tfstate"
    dynamodb_table = "terraform-remote-state-dynamo"
    region         = "us-west-2"
  }
}
provider "aws" {
  region = var.aws_region
  #profile = "terraform"
}
