provider "aws" {
  region = var.region_name
}

module "aws_vpc" {
  source                    = "./modules/vpc"
  region_name               = var.region_name
  vpc_cidr_block            = var.vpc_cidr_block
  project_name              = var.project_name
  version_number            = var.version_number
  public_subnet_cidr_block  = var.public_subnet_cidr_block
  availability_zones        = var.availability_zones
  private_subnet_cidr_block = var.private_subnet_cidr_block
}

module "aws_security_group" {
  source         = "./modules/security-group"
  sg_name        = var.sg_name
  version_number = var.version_number
  project_name   = var.project_name
  vpc_id         = module.aws_vpc.vpc_id
}

module "aws_instance" {
  source            = "./modules/ec2"
  key_name          = var.key_name
  aws_insrance_type = var.insrance_type
  vpc_id            = module.aws_vpc.vpc_id
  security_group_id = module.aws_security_group.security_group_id
  public_subnet_ids = module.aws_vpc.public_subnet_ids
  ami               = var.ami
}

module "aws_iam" {
    source = "./modules/iam"
    iam_user_name = var.iam_user_name
    iam_group_name = var.iam_group_name
}
