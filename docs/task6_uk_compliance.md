# Task 6 — UK Compliance Considerations

## 1. AWS-Native Controls for UK GDPR Compliance
- IAM least privilege
- MFA
- KMS encryption
- S3 SSE
- RDS encryption
- Secrets Manager
- CloudTrail
- GuardDuty
- AWS Config
- Security Hub

---

## 2. UK/EU Data Residency
- Deploy in eu-west-2 (London)
- Restrict backups to UK/EU
- SCP regional controls
- No external replication
- Compliance monitoring

---

## 3. Right to Erasure
### Process:
1. Verify request
2. Delete DB records
3. Delete S3 objects
4. Purge backups
5. Revoke IAM access
6. Delete secrets
7. Maintain audit logs
8. Confirm deletion
