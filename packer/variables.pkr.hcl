variable "region" {
  type    = string
  default = "ap-southeast-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "vpc_id" {
  type = string
  default = "vpc-0cefb84e43686e4c3"
}

variable "subnet_id" {
  type = string
  default = "subnet-06ab58d328cd401fd"
}

variable "winrm_username" {
  type    = string
  default = "Administrator"
}

variable "winrm_password" {
  type      = string
  default =  "SuperS3cr3t!"
}
