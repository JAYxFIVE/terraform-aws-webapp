# 🚀 Terraform AWS Web App Infrastructure

This project provisions a production-style AWS 2-tier architecture using Terraform, including networking, compute, load balancing, and database layers.

It demonstrates Infrastructure as Code (IaC) best practices such as modular design, environment configuration, and secure network segmentation.

---

## 🧱 Architecture Overview

This project deploys:

- VPC with public and private subnets across two Availability Zones
- Internet Gateway for public access
- NAT Gateway for outbound access from private subnets
- Application Load Balancer (ALB) for traffic distribution
- EC2 instance(s) hosting a web application
- RDS (MySQL) database in private subnets
- Security Groups enforcing least-privilege access
- Terraform remote state (S3 backend)

### Traffic Flow

```text

Internet

  ↓
   
[Application Load Balancer]

  ↓
   
[EC2 Instances - Public Subnet]

  ↓
   
[RDS Database - Private Subnet]
```

## 📁 Project Structure

```text
.
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── versions.tf
├── backend.tf
├── terraform.tfvars
├── README.md
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── security_groups/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── ec2/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── alb/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── rds/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

## Modules

- **vpc** → networking (subnets, IGW, NAT, route tables)  
- **security_groups** → access control rules  
- **ec2** → compute resources and user data  
- **alb** → load balancer and target groups  
- **rds** → database and subnet group
  
## 🔧 Configuration

Update terraform.tfvars with your values:

```hcl
aws_region   = "us-east-1"
project_name = "resume-webapp"
environment  = "dev"

instance_type = "t3.micro"

my_ip       = "YOUR_IP/32"
db_password = "StrongPassword123!"
```

## ▶️ Deployment

Initialize Terraform:

- terraform init

Preview changes:

- terraform plan

Deploy infrastructure:

- terraform apply

Destroy resources when finished:

- terraform destroy

## 📤 Outputs

After deployment, Terraform will output:

- ALB DNS Name → Access your web application
- VPC ID
- Subnet IDs
- EC2 Instance ID
- RDS Endpoint (sensitive)

## 🔐 Security Design
- RDS is deployed in private subnets (no public access)
- EC2 only accepts traffic from the ALB security group
- SSH access restricted to trusted IP only
- Security groups enforce least-privilege access

## 🧠 Key Concepts Demonstrated
- Terraform module design and composition
- AWS networking (VPC, subnets, routing)
- Load balancing with ALB
- Infrastructure separation (public vs private tiers)
- Remote state management
- Reusable and parameterized infrastructure

## 📸 Screenshots


### AWS VPC dashboard
![VPC Subnets](images/subnets.jpg)

### ALB showing healthy targets
![ALB Screenshot](images/alb_target_group_dashboard.jpg)

### Browser hitting ALB DNS
![Brower to ALB DNS](images/browser_to_dns.jpg)

### Terraform apply output
![Outputs in CMD](images/outputs.jpg)

---

## 💼 Completed Summary

Built a modular Terraform project to provision a production-style AWS infrastructure including VPC, subnets, security groups, EC2, Application Load Balancer, and RDS. Implemented environment-based configuration, secure network segmentation, and reusable infrastructure components.

### 🧩 Lessons Learned
- How Terraform handles resource dependencies automatically
- Importance of separating infrastructure into modules
- Networking design for secure cloud environments
- Managing state and avoiding configuration drift

### ⚠️ Notes
- This project is for learning/demo purposes
- Costs may be incurred (NAT Gateway and RDS especially)
- Always run terraform destroy after testing

### ⭐ Why This Project Matters

This project demonstrates real-world Terraform skills including:

- modular architecture
- secure cloud design
- infrastructure lifecycle management