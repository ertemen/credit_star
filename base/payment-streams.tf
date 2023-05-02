
resource "aws_kinesis_stream" "landing_payment" {
  name = "landing-cstar-payment${var.staging_suffix}"
  shard_count = 1
  retention_period = var.landing_payment_stream_retention_period

  shard_level_metrics = [
    "ReadProvisionedThroughputExceeded",
    "WriteProvisionedThroughputExceeded"]

  tags = local.tags
}
