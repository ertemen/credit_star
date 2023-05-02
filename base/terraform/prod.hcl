include {
  path = "${get_terragrunt_dir()}/common.hcl"
}

inputs = {
  environment = "prd"

  vpc_id = get_env("CSTAR_PROD_VPC_ID")
  subnet_priv_1a_id = get_env("CSTAR_PROD_SUBNET_PRIV_1A_ID")
  subnet_priv_1b_id = get_env("CSTAR_PROD_SUBNET_PRIV_1B_ID")
  sg_to_internet_http_https = get_env("CSTAR_PROD_SG_TO_INTERNET_HTTP_HTTPS_ID")
  cstar_ops_sns_topic = get_env("CSTAR_PROD_CSTAR_OPS_SNS_TOPIC")
  cstar_postgres_credentials = get_env("cstar_postgres_credentials")


  s3_postgres_master_endpoint_arn = "arn:aws:dms:eu-west-1:700463361523:endpoint:S3QDRONNREAZQSRVJXVXDKHZEZXD3Y3J26YPUIA"





  landing_users_stream_retention_period = 240
  landing_loan_stream_retention_period = 240
  landing_payment_stream_retention_period = 240

}
