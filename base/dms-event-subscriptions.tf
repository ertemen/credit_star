
//sends failure events of replication tasks to sns topic
resource "aws_dms_event_subscription" "cstar_replication_tasks_event_notification" {
  enabled          = true
  event_categories = ["failure"]
  name             = "cstar-replication-tasks-notify-events"

  sns_topic_arn    = local.sns.aws_sns_topic_cstar_ops_arn
  source_type      = "replication-task"

  tags = local.tags
}

//sends failure,failover, low storage events of replication instances to sns topic
resource "aws_dms_event_subscription" "cstar_replication_instances_event_notification" {
  enabled          = true
  event_categories = ["failure", "failover", "low storage"]
  name             = "cstar-replication-instances-notify-events"
  sns_topic_arn    = local.sns.aws_sns_topic_cstar_ops_arn
  source_ids       = [
    aws_dms_replication_instance.cstar_dms_kinesis.replication_instance_id,
    aws_dms_replication_instance.cstar_dms_s3.replication_instance_id
  ]
  source_type      = "replication-instance"

  tags = local.tags
}