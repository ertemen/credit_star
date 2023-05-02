
output "landing_payment_stream_arn" {
  value = aws_kinesis_stream.landing_payment.arn
}

output "landing_payment_stream_name" {
  value = aws_kinesis_stream.landing_payment.name
}
