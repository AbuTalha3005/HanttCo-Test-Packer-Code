provider "aws" {
  region = var.region
}

resource "aws_instance" "controller" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = var.security_group_ids
  
  tags = {
    Name = "${var.project_name}-Win-NginxServer"
  }
  
  user_data = <<-EOF
    <powershell>
    ${file("bootstrap_win.txt")}
    </powershell>
  EOF
}
