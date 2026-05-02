variable "aws_region" {
  default = "eu-west-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "ec2_ami" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-0e5f882be1900e43b"
}

variable "db_password" {
  description = "Database master password"
  type        = string
  default     = "PayrollSecure#2026!"
}
