resource "aws_db_subnet_group" "db_subnet_group" {
  name = "payroll-db-subnet-group"

  subnet_ids = [
    aws_subnet.private_az1.id,
    aws_subnet.private_az2.id
  ]

  tags = {
    Name = "Payroll DB Subnet Group"
  }
}

resource "aws_db_instance" "postgres" {
  identifier        = "payroll-postgres-db"
  engine            = "postgres"
  engine_version    = "15"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  storage_type      = "gp2"

  db_name  = "payrolldb"
  username = "payrolladmin"
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  multi_az                = false
  publicly_accessible     = false
  storage_encrypted       = true
  backup_retention_period = 7

  skip_final_snapshot = true
  deletion_protection = false

  tags = {
    Name = "Payroll PostgreSQL Database"
  }
}
