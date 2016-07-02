provider "aws" {
  region = "us-west-2"
}

variable "vpc_name" {
	type = "string"
}

variable "zone_name" {
	type = "string"
}

data "aws_availability_zones" "zones" {}

module "vpc" {
  source = "modules/vpc"

  vpc_name  = "${var.vpc_name}"
  zone_name = "${var.zone_name}"

  cidr_block      = "10.1.0.0/16"
  private_subnets = ["10.1.160.0/19", "10.1.192.0/19", "10.1.224.0/19"]
  public_subnets  = ["10.1.0.0/21", "10.1.8.0/21", "10.1.16.0/21"]

  availability_zones = ["${data.aws_availability_zones.zones.names}"]
}

output "private_subnet_ids" {
  value = ["${module.vpc.private_subnets}"]
}

output "public_subnet_ids" {
  value = ["${module.vpc.public_subnets}"]
}

output "private_availability_zones" {
  value = ["${module.vpc.private_availability_zones}"]
}

output "public_availability_zones" {
  value = ["${module.vpc.public_availability_zones}"]
}

output "vpc_name" {
  value = "${module.vpc.vpc_name}"
}

output "zone_id" {
  value = "${module.vpc.zone_id}"
}

output "zone_name" {
  value = "${module.vpc.zone_name}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "cidr_block" {
  value = "${module.vpc.cidr_block}"
}
