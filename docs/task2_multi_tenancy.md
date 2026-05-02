# Task 2 — Multi-Tenancy Architecture

## Objective
Design a secure multi-tenancy model for the Oceans Across payroll platform that enforces strict separation for Companies, Bureaus, and Employees.

---

## 2a. Tenant Isolation Strategy

### Selected Model: Database-per-Tenant

### Justification:
- Strongest security isolation
- Prevents cross-tenant data leakage
- Supports payroll-grade compliance
- Separate backups
- Simplifies audits
- Reduces breach blast radius

### Rejected Alternatives:
#### Shared Database + tenant_id
- Higher query leakage risk
- Heavy app logic dependency

#### Schema-per-Tenant
- Better than shared DB
- Still weaker than dedicated databases

---

## Tenant Login & Context Propagation

### Login Flow:
1. User authenticates securely
2. JWT token issued
3. Token contains:
   - tenant_id
   - tenant_type
   - user_role

### Example JWT:
```json
{
  "tenant_id": "company_123",
  "tenant_type": "company",
  "role": "admin"
}
## 2b. Access Boundaries at the Infrastructure Layer

### IAM Role Separation

Separate IAM roles are provisioned for:

- company-role
- bureau-role
- employee-role

### Company Role:
- Access only company EC2 resources
- Access only company-specific S3 prefixes
- Access only company tenant database

### Bureau Role:
- Access only bureau resources
- Access only assigned client records
- Restricted S3 paths

### Employee Role:
- Read-only personal payroll access
- No broader tenant visibility

---

### S3 Storage Isolation

Tenant documents are isolated via dedicated prefixes:

```bash
s3://oceans-payroll-docs/company_123/
s3://oceans-payroll-docs/bureau_456/
s3://oceans-payroll-docs/employee_789/



---

# STEP 4 — Add Section 2c

```md id="jlwqoe"
## 2c. Tenant Onboarding & Offboarding

### Tenant Onboarding Process

When a new Company or Bureau is provisioned:

### Created Resources:
- Unique tenant_id
- Dedicated database
- Tenant IAM role
- S3 storage prefix
- Security groups
- User roles
- Monitoring
- Backup policies
- Audit logging

### Workflow:
1. Tenant approved
2. Terraform provisions resources
3. IAM role assigned
4. DB created
5. S3 path created
6. Access credentials issued
7. Monitoring enabled

### Day-One Isolation:
- Separate IAM
- Separate DB
- Separate storage
- Separate audit trail

---

### Tenant Offboarding Process

### Steps:
1. Disable IAM roles
2. Revoke credentials
3. Terminate sessions
4. Export required compliance data
5. Securely delete DB
6. Remove S3 documents
7. Archive audit logs
8. Record offboarding evidence

---

### Compliance Controls:
- GDPR-aligned deletion
- Retention policy enforcement
- Immutable audit logs
- Legal hold support
