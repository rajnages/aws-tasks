variable "sg_name" {
  description = "The name of the security group"
  type        = string
}
variable "project_name" {
    description = "The name of the project"
    type        = string
}
variable "version_number" {
    description = "The version number of the project"
    type        = number
}

variable "vpc_id" {
  type = string
}
