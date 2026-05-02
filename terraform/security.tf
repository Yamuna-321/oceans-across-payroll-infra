resource "aws_security_group" "companies_sg" {
  vpc_id = aws_vpc.main.id
}

resource "aws_security_group" "bureaus_sg" {
  vpc_id = aws_vpc.main.id
}

resource "aws_security_group" "employees_sg" {
  vpc_id = aws_vpc.main.id
}

resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.main.id
}
