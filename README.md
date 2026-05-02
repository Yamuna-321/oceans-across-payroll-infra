
# Oceans Across Payroll Infrastructure Platform

## Project Overview

This repository contains the Infrastructure as Code (IaC), security architecture, deployment design, and operational documentation for the Oceans Across UK payroll platform.

The platform is designed to securely process highly sensitive payroll information, including:

* Employee bank account details
* National Insurance / Social Security numbers
* Payroll records
* Employer data

The system serves three isolated tenant environments:

* **Companies Portal**
* **Bureaus Portal**
* **Employees Portal**

Each tenant has dedicated compute, IAM boundaries, and security controls to enforce strict access isolation.

---

## Core AWS Architecture

### Infrastructure Components

### Networking

* Custom VPC (`10.0.0.0/16`)
* Public subnets across 2 Availability Zones
* Private subnets across 2 Availability Zones
* Internet Gateway
* NAT Gateway for secure outbound private access
* Route tables and subnet associations

### Compute Layer

* 3 dedicated EC2 instances (`t3.micro`)

  * Companies tenant
  * Bureaus tenant
  * Employees tenant

### Database Layer

* Amazon RDS PostgreSQL (`db.t3.micro`)
* Private subnet deployment
* Storage encryption enabled
* Backup retention configured
* Restricted security group access

### Storage Layer

* S3 bucket for payroll reports and document storage
* Versioning enabled
* Server-side encryption enabled

### IAM & Security

* Separate IAM roles per tenant:

  * `company-role`
  * `bureau-role`
  * `employee-role`
* IAM instance profiles for EC2
* Security Groups per tenant
* Network ACL isolation
* Least privilege design

---

## Tenant Isolation Strategy

### Compute Isolation

Each user type is hosted on separate EC2 infrastructure to reduce lateral movement risk.

### IAM Isolation

Each tenant receives dedicated IAM roles to restrict AWS resource access.

### Network Isolation

* Separate security groups
* Private subnet segmentation
* Restricted RDS access
* Controlled S3 permissions

### Data Protection

* Encryption at rest
* Version-controlled storage
* Backup retention
* Private database deployment

---

## Deployment Instructions

### Prerequisites

* AWS CLI configured
* Terraform >= 1.5
* Git

### Steps

```bash
git clone <repository-url>
cd oceans-across-payroll-infra/terraform
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

### Cleanup

```bash
terraform destroy
```

---

## Repository Structure

```bash
oceans-across-payroll-infra/
│
├── terraform/
│   ├── provider.tf
│   ├── variables.tf
│   ├── vpc.tf
│   ├── security.tf
│   ├── iam.tf
│   ├── ec2.tf
│   ├── rds.tf
│   ├── s3.tf
│   ├── outputs.tf
│   └── terraform.tfvars
│
├── diagrams/
│   └── architecture-diagram.png
│
├── docs/
│   ├── ai_log.md
│   └── runbook.md
│
├── pipeline/
│   └── Jenkinsfile
│
├── docker/
│   ├── companies.Dockerfile
│   ├── bureaus.Dockerfile
│   └── employees.Dockerfile
│
└── README.md
```

---

## Security Decisions

### Key Controls Implemented

### Identity

* Least privilege IAM
* Tenant-specific roles
* Scoped instance profiles

### Network

* Public/private subnet separation
* NAT for private workloads
* Security group restrictions
* NACL boundaries

### Storage

* S3 encryption
* Versioning
* Restricted bucket access

### Database

* Private-only RDS
* Encryption
* Controlled inbound rules
* Backup retention

---

## Trade-offs Considered

| Decision                 | Benefit               | Trade-off                        |
| ------------------------ | --------------------- | -------------------------------- |
| Dedicated EC2 per tenant | Stronger isolation    | Higher cost                      |
| NAT Gateway              | Secure private access | Additional AWS cost              |
| Single RDS instance      | Lower cost            | Shared DB operational complexity |
| S3 versioning            | Recovery support      | Increased storage                |
| Simplified architecture  | Easier implementation | Lower scalability                |

---

## Incident Response Runbook Summary

### EC2 Compromise

* Isolate affected security group
* Rotate IAM credentials
* Snapshot instance
* Replace infrastructure via Terraform

### RDS Failure

* Restore from automated backups
* Validate DB subnet integrity
* Re-enable restricted access

### S3 Exposure

* Block public access
* Rotate credentials
* Review bucket policies
* Audit access logs

### IAM Credential Leak

* Disable compromised keys
* Force password rotation
* Audit CloudTrail logs

---

## CI/CD Pipeline

Jenkins pipeline includes:

* Source checkout
* Terraform validation
* Security scanning
* Docker image build
* Deployment automation

---

## AI Usage Disclosure

AI tools (ChatGPT) were used for:

* Terraform scaffolding
* Security best practices validation
* Documentation structuring
* README drafting
* Architecture planning

Complete logs are available in:

```bash
docs/ai_log.md
```

All generated content was reviewed, modified, and adapted for project requirements.

---

## Compliance Considerations

This architecture aligns with:

* UK payroll data sensitivity
* Principle of least privilege
* Infrastructure isolation
* Backup and disaster recovery readiness
* Secure document retention

---

## Future Enhancements

* Auto Scaling Groups
* Application Load Balancers
* WAF integration
* AWS Secrets Manager
* Multi-AZ RDS
* CloudWatch centralized monitoring
* GuardDuty
* Security Hub

---

## Final Notes

This project prioritizes:

* Security-first design
* Tenant isolation
* Infrastructure clarity
* Compliance readiness
* Operational maturity
* Professional DevOps practices

The implementation is intended as a deployment-ready infrastructure blueprint for the Oceans Across payroll platform.
---

## Task 2 — Multi-Tenancy Architecture

### Documentation
- docs/task2_multi_tenancy.md
- docs/architecture-diagram.md

### Covers:
- Database-per-tenant isolation strategy
- Tenant login context via JWT
- Secure request lifecycle propagation
- Query/API cross-tenant prevention
- IAM role separation
- S3 prefix access boundaries
- Tenant onboarding
- Tenant offboarding
- Compliance and audit controls

### Security Model
Task 2 extends Task 1 by enforcing defense-in-depth through:

- Application-layer tenant validation
- Infrastructure-layer IAM restrictions
- Storage-layer S3 segregation
- Dedicated tenant resource isolation
### Infrastructure Access Boundaries (Task 2b)

- Separate IAM roles for:
  - Companies
  - Bureaus
  - Employees
- Tenant-scoped EC2 access
- Tenant-specific S3 prefixes
- Bucket policy restrictions
- Defense-in-depth beyond application logic
- Security Groups and infrastructure segmentation

### Tenant Storage Segregation

Example:
```bash
s3://oceans-payroll-docs/company_123/
s3://oceans-payroll-docs/bureau_456/
s3://oceans-payroll-docs/employee_789/




### Tenant Onboarding & Offboarding (Task 2c)

#### Tenant Onboarding

When a new Company or Bureau is onboarded, the platform provisions:

- Unique tenant_id
- Dedicated PostgreSQL database
- Tenant-specific IAM role
- S3 storage prefix or bucket
- Security groups
- Access credentials
- Monitoring configuration
- Backup policy
- Audit logging

#### Provisioning Workflow
1. Tenant registration approved
2. Terraform provisions isolated infrastructure
3. IAM boundaries applied
4. Dedicated storage and database created
5. Monitoring and backups enabled
6. Credentials securely issued

#### Day-One Isolation
- Separate IAM
- Separate data storage
- Separate security controls
- Separate backups
- Full audit trail

---

#### Tenant Offboarding

When a tenant is removed:

- IAM access revoked
- Credentials disabled
- Active sessions terminated
- Data exported if required
- Databases securely deleted
- S3 documents removed
- Audit logs archived
- Compliance retention enforced

#### Compliance Controls
- GDPR-aligned deletion
- Payroll retention policy
- Immutable audit records
- Legal hold support
### Infrastructure Access Boundaries (Task 2b)

- Separate IAM roles for:
  - Companies
  - Bureaus
  - Employees
- Tenant-scoped EC2 access
- Tenant-specific S3 prefixes
- Bucket policy restrictions
- Defense-in-depth beyond application logic
- Security Groups and infrastructure segmentation

### Tenant Storage Segregation

Example:
```bash
s3://oceans-payroll-docs/company_123/
s3://oceans-payroll-docs/bureau_456/
s3://oceans-payroll-docs/employee_789/
