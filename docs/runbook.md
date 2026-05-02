# Incident Response Runbook

## Objective
Provide operational procedures for responding to infrastructure, security, and tenant-related incidents in the Oceans Across payroll platform.

---

# 1. EC2 Security Compromise

## Indicators:
- Unauthorized access
- Suspicious API calls
- Credential misuse
- Unexpected outbound traffic

## Response:
1. Isolate affected EC2 instance via Security Group lockdown
2. Remove IAM role access
3. Snapshot instance for forensics
4. Rotate credentials
5. Review CloudTrail logs
6. Redeploy clean infrastructure via Terraform
7. Notify security stakeholders

---

# 2. IAM Credential Leak

## Response:
1. Disable compromised credentials immediately
2. Rotate access keys/passwords
3. Audit IAM activity
4. Validate role boundaries
5. Review S3 and RDS access
6. Reissue secure credentials

---

# 3. RDS Outage / Failure

## Response:
1. Verify RDS health
2. Check SG/NACL integrity
3. Restore from automated snapshot
4. Validate tenant DB routing
5. Reconnect services
6. Confirm data integrity

---

# 4. S3 Bucket Exposure

## Response:
1. Block public access immediately
2. Review bucket policies
3. Restrict IAM access
4. Audit object access logs
5. Rotate credentials
6. Restore deleted versions if needed

---

# 5. Cross-Tenant Security Incident

## Response:
1. Identify breach scope
2. Revoke affected tenant access
3. Audit IAM boundaries
4. Review middleware controls
5. Validate DB routing
6. Notify compliance stakeholders
7. Preserve forensic logs

---

# 6. Secrets Exposure

## Response:
1. Rotate Secrets Manager values
2. Revoke affected tokens
3. Audit application logs
4. Validate runtime secret injection
5. Review access patterns

---

# 7. Disaster Recovery

## Recovery Components:
- Terraform IaC redeployment
- RDS snapshot restoration
- S3 version recovery
- IAM role recreation
- Monitoring restoration

---

# 8. Monitoring & Logging

## Required Services:
- CloudTrail
- CloudWatch
- GuardDuty
- VPC Flow Logs
- S3 Access Logs

---

# 9. Compliance Requirements

### Must Support:
- GDPR
- Payroll data retention
- Secure deletion
- Audit immutability
- Legal hold

---

# Final Operational Principles
- Least privilege
- Defense-in-depth
- Tenant isolation
- Automated recovery
- Secure auditability
- Minimal blast radius
