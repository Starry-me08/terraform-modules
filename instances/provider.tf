terraform {

  backend "s3" {
    bucket         = "ola32-dev-77"
    key            = "terraform/terraform.tfstate"
    dynamodb_table = "terraform-remote-state-dynamo"
    region         = "us-east-2"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = "~> 1.0"
}

provider "aws" {
  region = var.aws_region
  #profile = "terraform"
}
