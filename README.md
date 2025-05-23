# Windows NGINX Provisioning on AWS with Packer, Terraform, and Ansible
This project automates the creation of a Windows Server AMI with NGINX installed and HTTPS configured using **Packer** and **Ansible**, then deploys that AMI using **Terraform** on AWS.

## 🧱 Project Structure
![image](https://github.com/user-attachments/assets/dfbce273-021b-40d7-84b5-a5882a41be9b)

## Workflow Overview
1. **Packer**: Builds a Windows AMI from a base image and embeds required configurations or tools.
2. **Terraform**: Deploys an EC2 instance from the Packer-built AMI.
3. **Ansible**: Configures the EC2 instance with NGINX and HTTPS over WinRM.

## Prerequisites
- AWS CLI with credentials configured
- Packer (`>= 0.0.1`)
- Terraform (`v1.3+`)
- Ansible (`v2.9+`)
- A base Windows Server AMI ID (e.g., 2019 or 2022)
- Open WinRM port (`5985`) and configure security group appropriately

## 🔨 How to Use

### 1. Build the AMI with Packer
cd packer
packer init .
packer build windows.pkr.hcl
Ensure auto.pkrvars.hcl contains required values like:
vpc_id         = "vpc-0cefb84e43686e4c3"
subnet_id      = "subnet-06ab58d328cd401fd"
winrm_password = "put in your Password"
![Windows-AMI-Created](https://github.com/user-attachments/assets/502aaafd-e294-482b-a8e6-e2d6696b4535)

![AWS-Windows-AMI-Created](https://github.com/user-attachments/assets/702eee0a-0ac7-4356-82ef-107b4fa0a7e0)

### 2. Deploy the EC2 instance with Terraform
cd ../terraform
terraform init
terraform plan
terraform apply

![Instance Created with the New AMI](https://github.com/user-attachments/assets/84a6ab85-3597-426d-96e7-0a2e2c7f7bd5)

![Ec2-Instance-Deployed-Using-Custom-AMI](https://github.com/user-attachments/assets/2b5ae446-91e0-4146-bd47-a7905ad55069)

### 3. Configure the EC2 with Ansible
[win]
<EC2_PUBLIC_IP>

[win:vars]
ansible_user=Administrator
ansible_password="put in your password"
ansible_port=5985
ansible_connection=winrm
ansible_winrm_scheme=http
ansible_winrm_server_cert_validation=ignore
ansible_winrm_kerberos_delegation=true

Then run:
cd ../ansible
ansible-playbook -i hosts.ini playbook.yml

![Ansible-Playbook-Sucessful](https://github.com/user-attachments/assets/59dd0791-7717-4a90-b07c-01776f2ce7d6)

### 4. Test the NGINX Server

![Nginix_Successfully](https://github.com/user-attachments/assets/b83e7e40-7465-4646-9c90-5404ebe11bac)
