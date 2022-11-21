provider "aws" {
  region = var.region
}

locals {
  common_tags = {
    Application = var.app_name
    Region      = var.region
    Terraform   = true
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "oidc_bucket"

  tags = {
    Name        = "OIDC bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}