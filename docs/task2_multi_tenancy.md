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
