resource "aws_iam_role" "company_role" {
  name = "company-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role" "bureau_role" {
  name = "bureau-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role" "employee_role" {
  name = "employee-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_instance_profile" "company_profile" {
  name = "company-profile"
  role = aws_iam_role.company_role.name
}

resource "aws_iam_instance_profile" "bureau_profile" {
  name = "bureau-profile"
  role = aws_iam_role.bureau_role.name
}

resource "aws_iam_instance_profile" "employee_profile" {
  name = "employee-profile"
  role = aws_iam_role.employee_role.name
}
