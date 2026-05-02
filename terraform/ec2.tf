resource "aws_instance" "companies" {
  ami                    = var.ec2_ami
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_az1.id
  vpc_security_group_ids = [aws_security_group.companies_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.company_profile.name

  tags = {
    Name   = "companies-instance"
    Tenant = "Companies"
  }
}

resource "aws_instance" "bureaus" {
  ami                    = var.ec2_ami
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_az1.id
  vpc_security_group_ids = [aws_security_group.bureaus_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.bureau_profile.name

  tags = {
    Name   = "bureaus-instance"
    Tenant = "Bureaus"
  }
}

resource "aws_instance" "employees" {
  ami                    = var.ec2_ami
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_az2.id
  vpc_security_group_ids = [aws_security_group.employees_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.employee_profile.name

  tags = {
    Name   = "employees-instance"
    Tenant = "Employees"
  }
}
