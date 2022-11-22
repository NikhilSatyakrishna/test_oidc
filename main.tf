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
data "aws_iam_policy_document" "vsensor_assume_policy" {
  version = "2012-10-17"
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "vsensor_role" {
  name               = data.bnw_name.vsensor_role_name.name
  assume_role_policy = data.aws_iam_policy_document.vsensor_assume_policy.json
  tags               = local.common_tags
}