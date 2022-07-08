output "output" {
  value = {
    log_group = aws_cloudwatch_log_group.this
    kms_arn   = var.kms_key_id != null ? var.kms_key_id : aws_kms_key.log_key[0].arn
  }
}
