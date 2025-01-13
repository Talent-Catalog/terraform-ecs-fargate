
# See https://developer.hashicorp.com/terraform/tutorials/aws/aws-rds

resource "aws_db_parameter_group" "superset" {
  name   = "superset"
  family = "postgres14"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "superset" {
  identifier           = "superset"
  instance_class       = "db.t3.micro"
  allocated_storage    = 5
  engine               = "postgres"
  engine_version       = "14.3"
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.database.id]
  parameter_group_name   = aws_db_parameter_group.superset.name
  publicly_accessible  = false
  skip_final_snapshot  = true

}
