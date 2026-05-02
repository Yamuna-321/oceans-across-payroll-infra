# Final AWS Payroll Platform Architecture Diagram

```mermaid
graph TB

    Users[UK Payroll Platform Users]
    Companies[Companies Portal]
    Bureaus[Bureaus Portal]
    Employees[Employees Portal]

    Users --> Companies
    Users --> Bureaus
    Users --> Employees

    GitHub[GitHub Repository]
    Actions[GitHub Actions CI/CD]
    GitHub --> Actions

    subgraph AWS[AWS Cloud - eu-west-2]
        subgraph VPC[Payroll VPC 10.0.0.0/16]

            IGW[Internet Gateway]
            NAT[NAT Gateway]

            subgraph PublicAZ1[Public Subnet AZ1]
                ALB1[Load Balancer / Bastion]
            end

            subgraph PublicAZ2[Public Subnet AZ2]
                ALB2[HA Routing]
            end

            subgraph PrivateAZ1[Private Subnet AZ1]
                EC2C[Companies EC2]
                EC2B[Bureaus EC2]
            end

            subgraph PrivateAZ2[Private Subnet AZ2]
                EC2E[Employees EC2]
                RDS[(PostgreSQL RDS)]
            end

            S3[S3 Payroll Documents]
            Secrets[Secrets Manager / SSM]
            CW[CloudWatch]
            SNS[SNS Alerts]

            IAMC[Company IAM Role]
            IAMB[Bureau IAM Role]
            IAME[Employee IAM Role]

            SG[Security Groups]
            NACL[NACLs]
            KMS[KMS Encryption]
        end
    end

    Companies --> IGW
    Bureaus --> IGW
    Employees --> IGW

    IGW --> ALB1
    IGW --> ALB2

    ALB1 --> EC2C
    ALB1 --> EC2B
    ALB2 --> EC2E

    Actions --> EC2C
    Actions --> EC2B
    Actions --> EC2E

    EC2C --> RDS
    EC2B --> RDS
    EC2E --> RDS

    EC2C --> S3
    EC2B --> S3
    EC2E --> S3

    EC2C --> Secrets
    EC2B --> Secrets
    EC2E --> Secrets

    IAMC --> EC2C
    IAMB --> EC2B
    IAME --> EC2E

    SG --> EC2C
    SG --> EC2B
    SG --> EC2E
    SG --> RDS

    NACL --> VPC

    KMS --> S3
    KMS --> RDS

    CW --> SNS
    EC2C --> CW
    EC2B --> CW
    EC2E --> CW
    RDS --> CW
