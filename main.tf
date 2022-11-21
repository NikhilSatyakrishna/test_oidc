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
resource "random_id" "id" {
	  byte_length = 8
}


resource "aws_s3_bucket" "b" {
  bucket = "${random_id.id.hex}-bucket"

  tags = {
    Name        = "OIDC bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}