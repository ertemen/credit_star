# DMS Replication instance having target s3
resource "aws_dms_replication_instance" "cstar_dms_s3" {
  allocated_storage = 100
  apply_immediately = true
  auto_minor_version_upgrade = true
  engine_version = "3.4.6"

  multi_az = false
  preferred_maintenance_window = "sun:19:30-sun:23:30"
  publicly_accessible = false
  replication_instance_class = "dms.t3.large"
  replication_instance_id = "${var.project_name}-cstar-s3"


  tags = local.tags


}

# DMS Replication instance having target kinesis
resource "aws_dms_replication_instance" "cstar_dms_kinesis" {
  allocated_storage = 100
  apply_immediately = true
  auto_minor_version_upgrade = true
  engine_version = "3.4.6"

  multi_az = false
  preferred_maintenance_window = "sun:19:30-sun:23:30"
  publicly_accessible = false
  replication_instance_class = "dms.t3.large"
  replication_instance_id = "${var.project_name}-cstar-kinesis"

  tags = local.tags



}

