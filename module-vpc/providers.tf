terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "ola32-dev-99"
    key            = "terraform/terraform.tfstate"
    dynamodb_table = "terraform-remote-state-dynamo"
    region         = "us-west-2"
  }
}

provider "aws" {
  region = var.aws_region
}