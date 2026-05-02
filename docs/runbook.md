# Incident Response Runbook

## EC2 Compromise
- Isolate security groups
- Revoke IAM access
- Snapshot instance
- Redeploy via Terraform
- Review logs

---

## IAM Credential Leak
- Disable compromised credentials
- Rotate keys
- Audit CloudTrail
- Apply stricter policies

---

## RDS Failure
- Restore from backups
- Validate subnet/security
- Re-enable services

---

## S3 Exposure
- Block public access
- Rotate credentials
- Audit bucket policy
- Review logs

---

## Disaster Recovery
- Terraform redeploy
- S3 version restore
- DB backup restore
