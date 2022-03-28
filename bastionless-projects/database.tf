resource "aws_db_instance" "dbrole" {
  db_name                     = "dbest"
  engine                      = "mysql"
  engine_version              = "5.7"
  instance_class              = "db.t3.micro"
  storage_type                = "gp2"
  allocated_storage           = 20
  allow_major_version_upgrade = false
  auto_minor_version_upgrade  = false
  multi_az                    = true
  skip_final_snapshot         = true
  publicly_accessible         = false
  port                        = var.ports[3]
  maintenance_window          = "Fri:11:00-Fri:12:00"
  backup_retention_period     = 7
  backup_window               = "09:00-10:50"
  username                    = file("./users.txt")
  db_subnet_group_name        = aws_db_subnet_group.dbgrp.id
  password                    = file("./pass.txt")
  vpc_security_group_ids      = [aws_security_group.securelnk2.id]
  delete_automated_backups    = true
  apply_immediately           = true

}

resource "aws_db_subnet_group" "dbgrp" {
  name       = "mydbsbnt"
  subnet_ids = [aws_subnet.subnt2[0].id, aws_subnet.subnt2[1].id, aws_subnet.subnt2[2].id]
}

# for read  replica  

resource "aws_db_instance" "rpdb" {
  replicate_source_db         = aws_db_instance.dbrole.id
  skip_final_snapshot         = true
  port                        = var.ports[3]
  vpc_security_group_ids      = [aws_security_group.securelnk2.id]
  delete_automated_backups    = true
  instance_class              = "db.t3.micro"
  storage_type                = "gp2"
  allocated_storage           = 30
  allow_major_version_upgrade = false
  auto_minor_version_upgrade  = false
  multi_az                    = false
  publicly_accessible         = false
  maintenance_window          = "Fri:11:00-Fri:12:00"
  backup_retention_period     = 7
  backup_window               = "09:00-10:50"
  availability_zone           = var.zones[count.index]
  count                       = 3
  apply_immediately           = true
}
