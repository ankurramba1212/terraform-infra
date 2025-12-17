# Infra-Pipeline

## Introduction
This repository contains a **production-grade Infrastructure as Code (IaC) setup** using **Terraform** and **Azure DevOps YAML pipelines**.  
The objective of this project is to design a **secure, scalable, and PR-driven CI/CD workflow** for managing cloud infrastructure across **Preprod** and **Prod** environments.

This repo follows real-world DevOps best practices such as:
- Environment isolation
- PR-based deployments
- Manual approval gates
- Reusable pipeline templates
- Safe Terraform plan and apply flow

---

## Repository Structure

INFRA-PIPELINE/
├── env/
│ ├── preprod/ # Pre-production Terraform code
│ └── prod/ # Production Terraform code
│
├── modules/ # Reusable Terraform modules
│
├── pipelines/
│ ├── preprod.yml # Preprod pipeline definition
│ └── prod.yml # Prod pipeline definition
│
├── templates/ # Azure DevOps reusable pipeline templates
│ ├── scanning.yml
│ ├── terraform-init-preprod.yml
│ ├── terraform-init-prod.yml
│ ├── terraform-plan.yml
│ └── terraform-apply.yml
│
├── tests/ # Future test cases
├── .gitignore
├── azure-pipelines.yml # Root pipeline (CI disabled intentionally)
├── README.md
└── todo_infra_architecture.png


---

## CI/CD Pipeline Flow

### Preprod Pipeline
Triggered when changes are pushed under:

env/preprod/**
**Stages:**
1. Scanning Stage – Security and validation checks  
2. Planning Stage – Terraform plan  
3. Manual Validation – Runs only after PR merge to `main`  
4. Implementation Stage – Terraform apply  

---
### Prod Pipeline
Triggered when changes are pushed under:

env/prod/**

**Stages:**
1. Scanning Stage  
2. Planning Stage  
3. Manual Approval (Mandatory)  
4. Terraform Apply  

⚠️ Production deployments are allowed **only after PR approval and merge to `main`**.

---

## Branch & Deployment Strategy

| Scenario | Scan | Plan | Manual | Apply |
|--------|------|------|--------|-------|
| Feature branch push | ✅ | ✅ | ❌ | ❌ |
| PR raised | ✅ | ✅ | ❌ | ❌ |
| PR approved (not merged) | ❌ | ❌ | ❌ | ❌ |
| PR approved & merged to main | ❌ | ❌ | ✅ | ✅ |

This strategy ensures:
- No accidental infrastructure changes
- Full audit trail
- Production safety

---

## Tools & Technologies

- Terraform
- Azure DevOps Pipelines
- Azure DevOps Git Repositories
- Terraform Modules
- Manual Validation Gates

---

## Getting Started

### Prerequisites
- Terraform ≥ 1.x
- Azure CLI
- Azure Subscription access
- Azure DevOps project with self-hosted agent

### Clone Repository
```bash
git clone https://github.com/<your-org>/Infra-Pipeline.git
cd Infra-Pipeline
cd env/preprod
terraform init
terraform plan


Build & Test

Currently validation is handled through Azure DevOps pipelines using:

Terraform init

Terraform plan

Manual approval

Terraform apply

Future enhancements may include:

Terraform linting

Policy as Code (OPA / Sentinel)

Contribution Guidelines

Create a feature branch

Make infrastructure or pipeline changes

Raise a Pull Request

Ensure plan stage succeeds

Get PR approval and merge

Notes

terraform.tfvars is committed only for demonstration purposes

Terraform state files are excluded via .gitignore

Root azure-pipelines.yml has CI disabled intentionally

Future Enhancements

Remote backend per environment

State locking

Drift detection

Cost estimation

Environment-level approvals

Author

Ankur Sharma
Cloud & DevOps Engineer

