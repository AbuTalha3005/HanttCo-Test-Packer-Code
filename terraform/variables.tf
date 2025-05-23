variable "region" {
  description = "The AWS region to deploy resources into (e.g., ap-southeast-1)"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for launching the Windows EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
}

variable "project_name" {
  description = "The project name used for tagging resources"
  type        = string
}

#provider "aws" {
#  region = var.region
#}

variable "subnet_id" {
  description = "The ID of an existing subnet where the EC2 instance will be launched"
  type        = string
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with the EC2 instance"
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of an existing VPC to launch resources into"
  type        = string
}
