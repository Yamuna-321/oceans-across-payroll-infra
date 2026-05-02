resource "aws_s3_bucket" "payroll_docs" {
  bucket = "oceans-across-payroll-docs"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.payroll_docs.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.payroll_docs.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
