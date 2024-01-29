resource "aws_db_subnet_group" "default" {
  name       = "demo_sub_grp"
  subnet_ids = [aws_subnet.public-us-east-1a.id, aws_subnet.public-us-east-1b.id]

  tags = {
    Name = "Demo subnet group"
  }
}

resource "aws_db_instance" "default" {
  engine               =  var.rds_db_engine
  engine_version       =  var.rds_db_engine_version
  identifier           =  var.rds_name
  username             =  var.rds_username
  password             =  var.rds_password
  instance_class       =  var.rds_db_instance_type
  allocated_storage    = 20
  db_subnet_group_name = aws_db_subnet_group.default.name
  publicly_accessible = var.rds_public_access
  iam_database_authentication_enabled = var.rds_iam_db_auth
  skip_final_snapshot  = true
}