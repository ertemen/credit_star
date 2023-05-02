
output "landing_users_stream_arn" {
  value = aws_kinesis_stream.landing_users.arn
}

output "landing_users_stream_name" {
  value = aws_kinesis_stream.landing_users.name
}
