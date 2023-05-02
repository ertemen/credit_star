# --- S3 --- BEGIN

output "cstar_jobs_bucket_name" {
  value = aws_s3_bucket.cstar_jobs.id
}

output "cstar_jobs_bucket_arn" {
  value = aws_s3_bucket.cstar_jobs.arn
}

output "cstar_events_bucket_name" {
  value = aws_s3_bucket.events.id
}

output "cstar_events_bucket_arn" {
  value = aws_s3_bucket.events.arn
}

output "cstar_glue_temp_bucket_name" {
  value = aws_s3_bucket.glue_temp.id
}

output "cstar_glue_temp_bucket_arn" {
  value = aws_s3_bucket.glue_temp.arn
}

output "cstar_dms_bucket_name" {
  value = aws_s3_bucket.cstar_jobs.id
}

output "cstar_dms_bucket_arn" {
  value = aws_s3_bucket.cstar_jobs.arn
}

# --- Glue --- BEGIN

output "glue_database_data_gateway_landing_name" {
  value = aws_glue_catalog_database.cstar_landing.name
}

output "glue_database_data_gateway_landing_arn" {
  value = aws_glue_catalog_database.cstar_landing.arn
}

# --- Glue --- END


# --- Miscellaneous --- BEGIN
output "kinesis_cloudwatch_log_group_name" {
  value = aws_cloudwatch_log_group.landing_kinesis_analytics.name
}

output "kinesis_cloudwatch_log_group_arn" {
  value = aws_cloudwatch_log_group.landing_kinesis_analytics.arn
}

output "glue_cloudwatch_log_group_name" {
  value = aws_cloudwatch_log_group.landing_glue.name
}

output "glue_cloudwatch_log_group_arn" {
  value = aws_cloudwatch_log_group.landing_glue.arn
}

# --- Miscellaneous --- END



# --- POSTGRES --- BEGIN
output "cstar_postgres_replica_secret_name" {
  value = aws_secretsmanager_secret.cstar_postgres_replica_credentials.name
}

output "cstar_postgres_replica_secret_arn" {
  value = aws_secretsmanager_secret.cstar_postgres_replica_credentials.arn
}

# --- SNS TOPIC --- BEGIN
output "cstar_ops_sns_topic_name" {
  value = local.sns.aws_sns_topic_cstar_ops_name
}

output "cstar_ops_sns_topic_arn" {
  value = local.sns.aws_sns_topic_cstar_ops_arn
}



