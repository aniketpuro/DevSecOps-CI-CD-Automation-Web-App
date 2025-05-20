# variables.tf
variable "region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "key_name" {
  type        = string
  description = "Your AWS key pair name"
}

variable "vpc_security_group_ids" {
  type = list(string)
}
