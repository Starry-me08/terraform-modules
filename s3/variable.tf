variable "table_name" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "terraform-remote-state-dynamo"
}

variable "aws_region" {
  type        = string
  description = "Region to create the global bucket"
  default     = "us-west-2"
}


variable "versioning" {
  type    = string
  default = "Enabled"
}

variable "env" {
  type    = list(string)
  default = ["dev", "prod"]
}