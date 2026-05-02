Context
You are joining the infrastructure team at Oceans Across, where we are building an end-to-end
payroll platform for the UK market. The platform handles highly sensitive data — employee bank
account details, social security numbers, payroll records, and employer information. It serves
three distinct user types through separate portals: Companies, Bureaus, and Employees, each
with strictly isolated access.
This assignment simulates the kind of infrastructure, security, and deployment work you will own
in this role.

Task 1 — AWS Infrastructure Setup
Design and provision the core AWS infrastructure for the payroll platform using Terraform or
CloudFormation. Your setup should include:
• A VPC with public and private subnets across at least two availability zones
• EC2 instances (t2.micro or t3.micro) for running backend services — one per tenant type
(Companies, Bureaus, Employees) to reflect isolation at the compute layer
• RDS (PostgreSQL, db.t3.micro) in a private subnet for the primary database
• S3 bucket for storing documents and payroll reports, with versioning enabled
• IAM roles scoped per tenant to enforce access boundaries at the AWS resource level
• Security Groups and NACLs configured to isolate traffic between tenant environments
