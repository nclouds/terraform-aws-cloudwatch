locals {
  identifier = var.append_workspace ? "${var.identifier}-${terraform.workspace}" : var.identifier

  default_tags = {
    Environment = terraform.workspace
    Name        = local.identifier
  }
  tags = merge(local.default_tags, var.tags)
}

resource "aws_kms_key" "log_key" {
  count = var.kms_key_id != null ? 0 : 1

  deletion_window_in_days = 10
  enable_key_rotation     = true
  description             = "KMS key 1"
}

resource "aws_cloudwatch_log_group" "this" {
  retention_in_days = var.retention_in_days
  name_prefix       = var.use_name_prefix ? "${local.identifier}-" : null
  kms_key_id        = var.kms_key_id != null ? var.kms_key_id : aws_kms_key.log_key[0].arn
  name              = var.use_name_prefix ? null : local.identifier

  tags = local.tags
}
