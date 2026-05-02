# Incident Response Runbook

## EC2 Security Compromise
- Isolate affected instance via security group changes
- Revoke IAM credentials
- Snapshot for forensic analysis
- Redeploy via Terraform
- Review CloudTrail logs

---

## IAM Credential Leak
- Disable compromised credentials immediately
- Rotate keys/passwords
- Audit IAM role activity
- Apply least privilege corrections

---

## RDS Outage
- Verify DB health
- Restore from backup snapshot
- Validate subnet and SG integrity
- Reconnect application services

---

## S3 Bucket Exposure
- Block public access
- Audit bucket policy
- Rotate credentials
- Review object access logs

---

## Backup & Disaster Recovery
- Maintain automated RDS backups
- S3 version recovery
- Terraform redeployment
- IAM restoration
