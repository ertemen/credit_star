
resource "aws_secretsmanager_secret" "cstar_postgres_replica_credentials" {
  name = "cstar-postgres-replica-credentials"
  tags = local.tags
}

resource "aws_secretsmanager_secret_version" "cstar_postgres_replica_credentials" {
  secret_id = aws_secretsmanager_secret.cstar_postgres_replica_credentials.id
  secret_string = var.cstar_postgres_replica_credentials
}






