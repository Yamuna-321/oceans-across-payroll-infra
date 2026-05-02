# Task 3 — Security & Access Control

## Objective
Implement enterprise-grade security controls for the Oceans Across payroll platform, focusing on:

- IAM
- RBAC
- Secrets management
- Encryption
- Network isolation
- Defense-in-depth

---

# 3a. IAM & Role-Based Access Control

## IAM Roles
Separate least-privilege roles:

- company-role
- bureau-role
- employee-role

### Company Role:
- Access only company resources
- Company S3 prefix only
- Company DB credentials only

### Bureau Role:
- Bureau client scope only

### Employee Role:
- Read-only personal payroll access

---

## Least Privilege Principles
- Scoped permissions only
- No wildcard admin access
- Instance profiles
- Role assumption boundaries
- Resource-level restrictions

---

## Credential Security
### Controls:
- No hardcoded credentials
- IAM role-based temporary credentials
- Secrets Manager
- SSM Parameter Store

---

# 3b. Secrets Management

## Services Used
- AWS Secrets Manager
- AWS SSM Parameter Store

### Managed Secrets:
- DB credentials
- API keys
- Encryption keys
- Service credentials

---

## Runtime Injection
Secrets retrieved dynamically:

```python id="jlwqr2"
db_password = get_secret("db_password")
