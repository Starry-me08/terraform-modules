# s3 bucket
resource "aws_s3_bucket" "s3-backend" {
  bucket = lower("ola32-${var.env[0]}-${random_integer.s3.result}")

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

/*
# Versioning
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.s3-backend.id
  versioning_configuration {
    status = var.versioning
  }
}
*/
# Random integer
resource "random_integer" "s3" {
  max = 100
  min = 1

  keepers = {
    bucket_owner = "ola"
  }
}

# Bucket encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "backend" {
  bucket = aws_s3_bucket.s3-backend.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.terraform-bucket-key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

/*
# Privay policies
resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.s3-backend.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
*/