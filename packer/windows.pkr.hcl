packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "firstrun-windows" {
  ami_name                    = "HanttCo-windows-Nginx-AMI-${local.timestamp}"
  region                      = "ap-southeast-1"
  instance_type               = "t2.micro"
  communicator                = "winrm"
  winrm_username              = "Administrator"
  winrm_password              = "SuperS3cr3t!"
  vpc_id                      = "vpc-0cefb84e43686e4c3"
  subnet_id                   = "subnet-06ab58d328cd401fd"
  associate_public_ip_address = true

  source_ami_filter {
    filters = {
      name                = "Windows_Server-2019-English-Full-Base*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    owners      = ["amazon"]
    most_recent = true
  }

  user_data_file = "scripts/bootstrap_win.txt"
}

build {
  name    = "learn-packer"
  sources = ["source.amazon-ebs.firstrun-windows"]
}
