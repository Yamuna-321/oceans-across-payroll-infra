# Task 3 — Security & Access Control Diagram

```mermaid
graph TB

    Users[Platform Users]

    Companies[Companies Portal]
    Bureaus[Bureaus Portal]
    Employees[Employees Portal]

    Users --> Companies
    Users --> Bureaus
    Users --> Employees

    subgraph AWS[AWS Security Architecture]

        IAMC[Company IAM Role]
        IAMB[Bureau IAM Role]
        IAME[Employee IAM Role]

        Secrets[Secrets Manager / SSM]

        KMS[KMS Encryption]

        SG[Security Groups]
        NACL[NACLs]

        EC2C[Companies EC2]
        EC2B[Bureaus EC2]
        EC2E[Employees EC2]

        RDS[(Encrypted PostgreSQL RDS)]

        S3[(Encrypted S3 Bucket)]

        TLS[TLS / SSL Secure Transit]

        CloudTrail[CloudTrail Audit Logs]
        GuardDuty[GuardDuty]
        Config[AWS Config]
    end

    Companies --> TLS
    Bureaus --> TLS
    Employees --> TLS

    TLS --> EC2C
    TLS --> EC2B
    TLS --> EC2E

    IAMC --> EC2C
    IAMB --> EC2B
    IAME --> EC2E

    Secrets --> EC2C
    Secrets --> EC2B
    Secrets --> EC2E

    KMS --> RDS
    KMS --> S3

    EC2C --> RDS
    EC2B --> RDS
    EC2E --> RDS

    EC2C --> S3
    EC2B --> S3
    EC2E --> S3

    SG --> EC2C
    SG --> EC2B
    SG --> EC2E
    SG --> RDS

    NACL --> SG

    CloudTrail --> IAMC
    CloudTrail --> IAMB
    CloudTrail --> IAME

    GuardDuty --> CloudTrail
    Config --> CloudTrail
