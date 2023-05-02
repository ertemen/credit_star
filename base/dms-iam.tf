
data "aws_iam_policy_document" "dms" {
  statement {
    actions = [
      "sts:AssumeRole"]

    principals {
      identifiers = [
        "dms.amazonaws.com"]
      type = "Service"
    }
  }
}

resource "aws_iam_role" "cstar_dms" {
  name = "${var.project_name}-cstar-dms"
  assume_role_policy = data.aws_iam_policy_document.dms.json
}

data "aws_iam_policy_document" "cstar_dms" {
  statement {
    actions = [
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:PutObjectTagging"]

    resources = [
      "${aws_s3_bucket.cstar_jobs.arn}/*"
    ]
  }

  statement {
    actions = [
      "s3:ListBucket"]

    resources = [
      aws_s3_bucket.cstar_jobs.arn
    ]
  }

  statement {
    actions = [
      "logs:PutLogEvents",
      "logs:Describe*",
      "logs:CreateLogStream",
      "logs:CreateLogGroup",
      "cloudwatch:PutMetricData",
    ]

    resources = [
      "*"
    ]
  }

  statement {
    actions = [
      "secretsmanager:GetSecretValue"
    ]

    resources = [
      aws_secretsmanager_secret.cstar_postgres_replica_credentials.arn
    ]
  }



  statement {
    actions = [
      "kinesis:DescribeStream",
      "kinesis:PutRecord",
      "kinesis:PutRecords"
    ]

    resources = [
      aws_kinesis_stream.landing_users.arn,
      aws_kinesis_stream.landing_loan.arn,
      aws_kinesis_stream.landing_payment.arn
    ]
  }
}

resource "aws_iam_role_policy" "dms_cstar_s3_cdc" {
  name = "${var.project_name}-cstar-dms"
  policy = data.aws_iam_policy_document.cstar_dms.json
  role = aws_iam_role.cstar_dms.id
}