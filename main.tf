locals {
  identifier = var.append_workspace ? "${var.identifier}-${terraform.workspace}" : var.identifier

  default_tags = {
    Environment = terraform.workspace
    Name        = local.identifier
  }
  tags = merge(local.default_tags, var.tags)
}

module "kms" {
  source = "git@github.com:nclouds/terraform-aws-kms.git?ref=v0.1.0"

  count = !var.use_custom_kms_key ? 1 : 0

  append_workspace = false
  deletion_window  = 10
  identifier       = local.identifier
  tags             = local.tags
}

resource "aws_cloudwatch_log_group" "this" {
  retention_in_days = var.retention_in_days
  name_prefix       = var.use_name_prefix ? "${local.identifier}-" : null
  kms_key_id        = var.use_custom_kms_key ? var.kms_key_id : module.kms[0].output.key_arn
  name              = var.use_name_prefix ? null : local.identifier

  tags = local.tags
}
