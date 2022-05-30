resource "aws_db_instance" "sqldbpa4dd01" {
  allocated_storage   = 20
  storage_type        = "standard"
  engine              = "postgres"
  engine_version      = "12.5"
  instance_class      = "db.t2.micro"
  name                = var.AWS_DATABASE_NAME
  username            = var.AWS_DATABASE_USERNAME
  password            = var.AWS_DATABASE_PASSWORD
  skip_final_snapshot = true
}