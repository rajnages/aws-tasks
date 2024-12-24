variable "region_name" {
  description = "The AWS region in which the VPC will be created"
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "project_name" {
  description = "value of the 'Name' tag for the VPC"
  type        = string
}
variable "version_number" {
  description = "The version number of the VPC"
  type        = number
}
variable "public_subnet_cidr_block" {
  description = "The CIDR block for the public subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "The availability zones for the public subnets"
  type        = list(string)
}

variable "private_subnet_cidr_block" {
  description = "The CIDR block for the private subnets"
  type        = list(string)
}

variable "sg_name" {
    description = "The name of the security group"
    type        = string
}

variable "key_name" {
    description = "The name of the key pair"
    type        = string
}
variable "insrance_type" {
    description = "The type of the instance"
    type        = string

}
variable "ami" {
    description = "The AMI to use for the instance"
    type        = string
}
variable "iam_user_name" {
    description = "The name of the IAM user"
    type        = list(string)
}
variable "iam_group_name" {
    description = "The name of the IAM group"
    type        = list(string)

}
