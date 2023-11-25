#import vpc module
provider "aws" {
  region = "ap-southeast-1"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "my-vpc"
  cidr   = var.vpc_cidr_block

  azs                = [var.avail_zone]
  public_subnets     = [var.subnet_cidr_block]
  public_subnet_tags = { Name = "${var.env_prefix}-subnet-1" }

  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}

module "papai-iam" {
  source     = "../../modules/iam"
  env_prefix = var.env_prefix
  # bucket_name = module.papai-s3-profilePic.bucket.id
  bucket_name = module.papai-s3-profilePic.bucket.bucket
}


module "papai-s3-profilePic" {
  source     = "../../modules/s3image"
  env_prefix = var.env_prefix
}

module "papai-app-server" {
  source              = "../../modules/webserver"
  vpc_id              = module.vpc.vpc_id
  my_ips              = var.my_ips
  env_prefix          = var.env_prefix
  image_name          = var.image_name
  public_key_location = var.public_key_location
  instance_type       = var.instance_type
  subnet_id           = module.vpc.public_subnets[0]
  avail_zone          = var.avail_zone
  iam_id              = module.papai-iam.iam.id
}
