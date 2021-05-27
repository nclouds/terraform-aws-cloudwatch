locals {
  identifier = var.append_workspace ? "${var.identifier}-${terraform.workspace}" : var.identifier

  default_tags = {
    Environment = terraform.workspace
    Name        = local.identifier
  }
  tags = merge(local.default_tags, var.tags)
}

resource "aws_cloudwatch_log_group" "this" {
  retention_in_days = var.retention_in_days
  name_prefix       = var.use_name_prefix ? "${local.identifier}-" : null
  kms_key_id        = var.kms_key_id
  name              = var.use_name_prefix ? null : local.identifier

  tags = local.tags
}
