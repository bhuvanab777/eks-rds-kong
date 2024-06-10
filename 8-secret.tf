resource "aws_secretsmanager_secret" "rds_database_password" {
  name = "rds_database_password"
}

resource "aws_secretsmanager_secret_version" "rds_database_password" {
  secret_id     = aws_secretsmanager_secret.rds_database_password.id
  secret_string = var.rds_password
}