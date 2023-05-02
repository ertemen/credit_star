# User table Replication task
resource "aws_dms_replication_task" "cstar_user_full_cdc_kinesis" {
  migration_type = "full-load-and-cdc"
  replication_instance_arn = aws_dms_replication_instance.cstar_dms_kinesis.replication_instance_arn
  replication_task_id = "cstar-user-full-cdc-kinesis"
  source_endpoint_arn = aws_dms_endpoint.cstar_postgres_prod_replica.endpoint_arn
  table_mappings = data.template_file.table_mappings_user_full_cdc_kinesis.rendered
  target_endpoint_arn = aws_dms_endpoint.cstar_landing_user_kinesis.endpoint_arn

  tags = local.tags

  replication_task_settings = data.template_file.task_settings_user_full_cdc_kinesis.rendered

  depends_on = [
    aws_dms_endpoint.cstar_landing_user_kinesis,
    aws_dms_endpoint.cstar_postgres_prod_replica,
    aws_dms_replication_instance.cstar_dms_kinesis
  ]
}


data "template_file" "table_mappings_user_full_cdc_kinesis" {
  template = file("dms/dms_table_mappings_user_full_cdc_kinesis.tpl")
}

data "template_file" "task_settings_user_full_cdc_kinesis" {
  template = file("dms/dms_repl_task_settings_user_full_cdc_kinesis.tpl")
}

resource "aws_cloudwatch_metric_alarm" "user_dms_full_cdc_alarm" {
  alarm_name = "user-dms"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "2"
  threshold = "0"
  insufficient_data_actions = []


  metric_query {
    id = "m1"
    return_data = "true"
    metric {
      metric_name = "CDCIncomingChanges"
      namespace = "AWS/DMS"
      period = "900"
      stat = "Average"
      unit = "Count"

      dimensions = {
        ReplicationTaskIdentifier = element(split(":", aws_dms_replication_task.cstar_user_full_cdc_kinesis.replication_task_arn), length(split(":", aws_dms_replication_task.cstar_user_full_cdc_kinesis.replication_task_arn))-1)
        ReplicationInstanceIdentifier = aws_dms_replication_instance.cstar_dms_kinesis.id
      }
    }
  }
}