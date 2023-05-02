# Postgres Source endpoint
resource "aws_dms_endpoint" "cstar_postgres_prod_replica" {
  database_name = var.cstar_postgres_db_name
  endpoint_id = "cstar-postgres-prod-replica"
  endpoint_type = "source"
  ssl_mode = "none"
  server_name = local.db_credentials.host
  engine_name = local.db_credentials.engine
  port = local.db_credentials.port
  username = local.db_credentials.username
  password = local.db_credentials.password

  tags = local.tags

}




# Kinesis User endpoint
resource "aws_dms_endpoint" "cstar_landing_user_kinesis" {
  endpoint_id = "${var.project_name}-cstar-game-kinesis"
  endpoint_type = "target"
  engine_name = "kinesis"

  kinesis_settings {
    service_access_role_arn = aws_iam_role.cstar_dms.arn
    stream_arn = aws_kinesis_stream.landing_users.arn
  }

  tags = local.tags

}

# Kinesis Loan endpoint
resource "aws_dms_endpoint" "cstar_landing_loan_kinesis" {
  endpoint_id = "${var.project_name}-cstar-loan-kinesis"
  endpoint_type = "target"
  engine_name = "kinesis"

  kinesis_settings {
    service_access_role_arn = aws_iam_role.cstar_dms.arn
    stream_arn = aws_kinesis_stream.landing_loan.arn
  }

  tags = local.tags

}

# Kinesis Payment endpoint
resource "aws_dms_endpoint" "cstar_landing_payment_kinesis" {
  endpoint_id = "${var.project_name}-cstar-payment-kinesis"
  endpoint_type = "target"
  engine_name = "kinesis"

  kinesis_settings {
    service_access_role_arn = aws_iam_role.cstar_dms.arn
    stream_arn = aws_kinesis_stream.landing_payment.arn
  }

  tags = local.tags

}


