output "instance_id" {
  description = "The ID of the Windows EC2 instance"
  value       = aws_instance.controller.id
}

output "instance_public_ip" {
  description = "The public IP address of the Windows EC2 instance"
  value       = aws_instance.controller.public_ip
}

output "instance_private_ip" {
  description = "The private IP address of the Windows EC2 instance"
  value       = aws_instance.controller.private_ip
}

output "instance_public_dns" {
  description = "The public DNS name of the Windows EC2 instance"
  value       = aws_instance.controller.public_dns
}

output "subnet_id" {
  description = "The subnet ID used for the instance"
  value       = aws_instance.controller.subnet_id
}

output "security_group_ids" {
  description = "List of security group IDs associated with the instance"
  value       = aws_instance.controller.vpc_security_group_ids
}
