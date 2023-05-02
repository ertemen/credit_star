
variable "landing_cstar_users_s3_prefix" {}
variable "landing_cstar_users_s3_error_prefix" {}
variable "users_cstar_stream_prefix" {}



variable "firehose_landing_cstar_users" {
  type = object({
    buffer_size = number
    buffer_interval = number
  })
  default = {
    buffer_size = 128
    buffer_interval = 60
  }
}

# --- Kinesis Stream Variables --- BEGIN
variable "landing_users_stream_retention_period" {}
# --- Kinesis Stream Variables --- END