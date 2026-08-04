# DigitalOcean Infrastructure - Microservices POC

## Overview

This repository provisions infrastructure on DigitalOcean using Terraform.

The infrastructure is designed for a Docker Compose based deployment and consists of:

- Ubuntu 24.04 Droplet
- DigitalOcean Project
- VPC
- Firewall
- SSH Key Integration
- Cloud-init
- Docker & Docker Compose Installation

The VM will host:

- Frontend
- 12 Microservices
- PostgreSQL
- Redis
- Nginx Reverse Proxy

---

# Architecture

Internet
        |
        |
+----------------+
| DO Firewall    |
+----------------+
        |
        |
+----------------------------+
| Ubuntu 24.04 Droplet       |
| Docker Compose             |
|                            |
| Frontend                   |
| 12 Microservices           |
| PostgreSQL                 |
| Redis                      |
| Nginx                      |
+----------------------------+

---

# Prerequisites

Install

- Terraform >= 1.7
- DigitalOcean Account
- SSH Key uploaded to DigitalOcean
- DigitalOcean Personal Access Token

---

# Repository Structure

terraform/
│
├── provider.tf
├── versions.tf
├── variables.tf
├── main.tf
├── droplet.tf
├── firewall.tf
├── outputs.tf
├── cloud-init.yaml
├── terraform.tfvars
└── README.md

---

# Variables to Update

Only update the following variables inside

terraform.tfvars

```
do_token

ssh_key_name

project_name

droplet_name

region

droplet_size
```

---

# Example terraform.tfvars

```hcl
do_token      = "dop_xxxxxxxxxxxxxxxxxxxxxxxxx"

ssh_key_name  = "vikram-laptop"

project_name  = "microservices-dev"

droplet_name  = "microservices-dev-vm"

region         = "blr1"

droplet_size   = "s-8vcpu-16gb"
```

---

# Variable Description

| Variable | Description | Example |
|----------|-------------|---------|
| do_token | DigitalOcean Personal Access Token | dop_xxxxx |
| ssh_key_name | Existing SSH Key Name in DigitalOcean | vikram-laptop |
| project_name | DigitalOcean Project Name | microservices-dev |
| droplet_name | VM Name | microservices-dev-vm |
| region | DigitalOcean Region | blr1 |
| droplet_size | VM Size | s-8vcpu-16gb |

---

# Recommended Regions

| Region | Location |
|---------|----------|
| blr1 | Bangalore |
| sgp1 | Singapore |
| nyc1 | New York |
| ams3 | Amsterdam |
| lon1 | London |
| fra1 | Frankfurt |

---

# Droplet Sizes

| Size | CPU | RAM |
|------|-----|-----|
| s-2vcpu-4gb | 2 | 4 GB |
| s-4vcpu-8gb | 4 | 8 GB |
| s-8vcpu-16gb | 8 | 16 GB |

Current deployment uses

```
s-8vcpu-16gb
```

---

# Initialize Terraform

```bash
terraform init
```

---

# Validate

```bash
terraform validate
```

---

# Format

```bash
terraform fmt -recursive
```

---

# Create Execution Plan

```bash
terraform plan
```

---

# Apply Infrastructure

```bash
terraform apply
```

Terraform will ask

```
Do you want to perform these actions?

yes
```

Type

```
yes
```

---

# Destroy Infrastructure

```bash
terraform destroy
```

---

# Outputs

Terraform will print

```
Public IP

Private IP

Droplet ID

SSH Command
```

Example

```
Public IP

143.xxx.xxx.xxx

SSH

ssh root@143.xxx.xxx.xxx
```

---

# Access Server

```
ssh root@<PUBLIC_IP>
```

Example

```
ssh root@143.xxx.xxx.xxx
```

---

# Verify Docker Installation

```
docker --version
```

```
docker compose version
```

---

# Verify Cloud Init

```
cloud-init status
```

Should return

```
status: done
```

---

# Verify Docker Service

```
systemctl status docker
```

---

# Verify Firewall

Allowed Ports

| Port | Purpose |
|-------|----------|
|22|SSH|
|80|HTTP|
|443|HTTPS|

---

# Environment Configuration

For every environment create a separate tfvars file.

Example

```
terraform.tfvars.dev

terraform.tfvars.test

terraform.tfvars.stage

terraform.tfvars.prod
```

Deploy

Development

```
terraform apply \
-var-file=terraform.tfvars.dev
```

Testing

```
terraform apply \
-var-file=terraform.tfvars.test
```

Stage

```
terraform apply \
-var-file=terraform.tfvars.stage
```

Production

```
terraform apply \
-var-file=terraform.tfvars.prod
```

---

# Recommended Naming Convention

Development

```
project_name = "microservices-dev"

droplet_name = "microservices-dev-vm"
```

Testing

```
project_name = "microservices-test"

droplet_name = "microservices-test-vm"
```

Stage

```
project_name = "microservices-stage"

droplet_name = "microservices-stage-vm"
```

Production

```
project_name = "microservices-prod"

droplet_name = "microservices-prod-vm"
```

---

# Estimated Monthly Cost

| Resource | Estimated Cost |
|-----------|----------------|
| 8 vCPU / 16 GB Droplet | ~$96 |
| VPC | Free |
| Firewall | Free |
| Monitoring | Free |
| SSH Key | Free |

Estimated Total

~$96/month

---

# Next Steps

After the infrastructure is created

1. SSH into the VM
2. Clone your application repository
3. Copy `.env`
4. Start Docker Compose

```
docker compose pull

docker compose up -d
```

Verify

```
docker ps
```

---

# Troubleshooting

Terraform Init

```
terraform init -upgrade
```

Terraform Plan

```
terraform validate
terraform plan
```

Terraform State

```
terraform state list
```

Cloud Init Logs

```
cat /var/log/cloud-init-output.log
```

Docker Logs

```
docker logs <container_name>
```

---

# Cleanup

Destroy infrastructure

```
terraform destroy
```

This removes all DigitalOcean resources created by Terraform.
