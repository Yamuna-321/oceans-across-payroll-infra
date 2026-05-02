# Task 5 — Monitoring & Incident Readiness Diagram

```mermaid
graph TB

    subgraph AWS[AWS Cloud - Payroll Platform]

        EC2C[Companies EC2]
        EC2B[Bureaus EC2]
        EC2E[Employees EC2]

        RDS[(PostgreSQL RDS)]

        S3[S3 Payroll Documents]

        CW[CloudWatch Monitoring]

        LogsApp[Application Log Group]
        LogsInfra[Infrastructure Log Group]

        AlarmCPU[EC2 CPU Alarm]
        AlarmRDS[RDS Connection Alarm]

        SNS[SNS Critical Alerts]

        Team[Infrastructure / Security Team]
    end

    EC2C --> CW
    EC2B --> CW
    EC2E --> CW
    RDS --> CW
    S3 --> CW

    CW --> LogsApp
    CW --> LogsInfra

    CW --> AlarmCPU
    CW --> AlarmRDS

    AlarmCPU --> SNS
    AlarmRDS --> SNS

    SNS --> Team
