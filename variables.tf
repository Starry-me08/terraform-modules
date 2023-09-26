locals {
  subnets = {
    "1a" = { "public_cidr": "10.0.1.0/24", private_cidr: "10.0.100.0/24"}
    "1b" = { "public_cidr": "10.0.2.0/24", private_cidr: "10.0.200.0/24"}
  }
}


variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24", ]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.100.0/24", "10.0.200.0/24", ]
}

variable "db_subnet_cidrs" {
  type        = list(string)
  description = "db Subnets CIDR values"
  default     = ["10.0.10.0/24", "10.0.20.0/24"]
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-2a", "us-east-2b", ]
}