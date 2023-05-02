
output "landing_loan_stream_arn" {
  value = aws_kinesis_stream.landing_loan.arn
}

output "landing_loan_stream_name" {
  value = aws_kinesis_stream.landing_loan.name
}
