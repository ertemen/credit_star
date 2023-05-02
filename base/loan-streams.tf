
resource "aws_kinesis_stream" "landing_loan" {
  name = "landing-cstar-loan${var.staging_suffix}"
  shard_count = 1
  retention_period = var.landing_loan_stream_retention_period

  shard_level_metrics = [
    "ReadProvisionedThroughputExceeded",
    "WriteProvisionedThroughputExceeded"]

  tags = local.tags
}
