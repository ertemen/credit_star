locals {
  tags = {
    Account: var.account
    Environment: var.environment
    ProjectName: var.project_name
    SubProjectName: var.sub_project_name
    SourceRepository: var.source_repository
    Terraform: true
  }

  //project_name_underscored = replace(var.project_name,"-","_")

  db_credentials = jsondecode(
  aws_secretsmanager_secret_version.cstar_postgres_replica_credentials.secret_string
  )



  s3 = {
    ### --- S3 ERROR --- BEGIN
    # --- S3 LANDING ERROR --- BEGIN
    landing_cstar_error_s3_arn = "${aws_s3_bucket.events.arn}/${var.landing_cstar_error_stream_prefix}/${var.landing_cstar_error_stream_prefix}"
    landing_cstar_error_s3_path = "${aws_s3_bucket.events.id}/${var.landing_cstar_error_stream_prefix}/${var.landing_cstar_error_stream_prefix}"
    landing_cstar_error_s3_folder = "${var.landing_cstar_error_stream_prefix}/${var.landing_cstar_users_s3_prefix}"
    # --- S3 LANDING ERROR --- END
    ### --- S3 ERROR --- END


    landing_cstar_users_s3_arn = "${aws_s3_bucket.events.arn}/${var.users_cstar_stream_prefix}/${var.landing_cstar_users_s3_prefix}"
    landing_cstar_users_s3_path = "${aws_s3_bucket.events.id}/${var.users_cstar_stream_prefix}/${var.landing_cstar_users_s3_prefix}"
    landing_cstar_users_s3_folder = "${var.users_cstar_stream_prefix}/${var.landing_cstar_users_s3_prefix}"
    landing_cstar_users_s3_error_arn = "${aws_s3_bucket.events.arn}/${var.users_cstar_stream_prefix}/${var.landing_cstar_users_s3_prefix}"
    landing_cstar_users_s3_error_path = "${aws_s3_bucket.events.id}/${var.users_cstar_stream_prefix}/${var.landing_cstar_users_s3_prefix}"
    landing_cstar_users_s3_error_folder = "${var.users_cstar_stream_prefix}/${var.landing_cstar_users_s3_prefix}"

    landing_cstar_loan_s3_arn = "${aws_s3_bucket.events.arn}/${var.loan_cstar_stream_prefix}/${var.landing_cstar_loan_s3_prefix}"
    landing_cstar_loan_s3_path = "${aws_s3_bucket.events.id}/${var.loan_cstar_stream_prefix}/${var.landing_cstar_loan_s3_prefix}"
    landing_cstar_loan_s3_folder = "${var.loan_cstar_stream_prefix}/${var.landing_cstar_loan_s3_prefix}"
    landing_cstar_loan_s3_error_arn = "${aws_s3_bucket.events.arn}/${var.loan_cstar_stream_prefix}/${var.landing_cstar_loan_s3_prefix}"
    landing_cstar_loan_s3_error_path = "${aws_s3_bucket.events.id}/${var.loan_cstar_stream_prefix}/${var.landing_cstar_loan_s3_prefix}"
    landing_cstar_loan_s3_error_folder = "${var.loan_cstar_stream_prefix}/${var.landing_cstar_loan_s3_prefix}"

    landing_cstar_payment_s3_arn = "${aws_s3_bucket.events.arn}/${var.payment_cstar_stream_prefix}/${var.landing_cstar_payment_s3_prefix}"
    landing_cstar_payment_s3_path = "${aws_s3_bucket.events.id}/${var.payment_cstar_stream_prefix}/${var.landing_cstar_payment_s3_prefix}"
    landing_cstar_payment_s3_folder = "${var.payment_cstar_stream_prefix}/${var.landing_cstar_payment_s3_prefix}"
    landing_cstar_payment_s3_error_arn = "${aws_s3_bucket.events.arn}/${var.payment_cstar_stream_prefix}/${var.landing_cstar_payment_s3_prefix}"
    landing_cstar_payment_s3_error_path = "${aws_s3_bucket.events.id}/${var.payment_cstar_stream_prefix}/${var.landing_cstar_payment_s3_prefix}"
    landing_cstar_payment_s3_error_folder = "${var.payment_cstar_stream_prefix}/${var.landing_cstar_payment_s3_prefix}"

  }

    sns = {
    //cstar ops sns topic created manually via aws console since it is open to frequent changes
    aws_sns_topic_cstar_ops_name = var.cstar_ops_sns_topic
    aws_sns_topic_cstar_ops_arn = "arn:aws:sns:${var.region}:${data.aws_caller_identity.current.account_id}:${var.cstar_ops_sns_topic}"
  }
}



