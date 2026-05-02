# Task 5 — Monitoring & Incident Readiness

## Monitoring Components

### CloudWatch Alarms
- EC2 CPU utilization > 80%
- RDS connection thresholds
- Critical infrastructure alerting

### CloudWatch Log Groups
- Application logs
- Infrastructure logs
- 30–90 day retention

### SNS Alerts
- Critical EC2 failures
- Database connection spikes
- Security incidents

---

## Incident Response Scenario:
### Database Accidentally Publicly Accessible

### Detection
- CloudWatch alerts
- Security scans
- VPC configuration reviews
- AWS Config alerts

### Investigation
1. Verify public accessibility setting
2. Review Security Groups
3. Review NACLs
4. Audit CloudTrail logs
5. Determine exposure window

### Recovery
1. Disable public access immediately
2. Restrict SG inbound rules
3. Rotate DB credentials
4. Audit tenant impact
5. Review backups
6. Notify stakeholders
7. Conduct postmortem

---

## Security Lessons
- Defense-in-depth
- Continuous monitoring
- Automated alerting
- Rapid credential rotation
- Compliance preservation
