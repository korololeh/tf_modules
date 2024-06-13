variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "env" {
  default = "test"
}

variable "public_subnet_cidrs" {
  default = [
    "10.0.1.0/24",
  ]
}

variable "aws_pair_key_name" {
  default = "aws_key_canada_region"
}
