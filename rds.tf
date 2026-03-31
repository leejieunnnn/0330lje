resource "aws_db_subnet_group" "terraform-rds-subnet-group" {
    name = "terraform-rds-subnet-group"
    subnet_ids=[aws_subnet.terraform-pri-subnet-2a.id, aws_subnet.terraform-pri-subnet-2c.id]

}

resource "aws_db_parameter_group" "terraform-mariadb-parameter-group" {
    name = "terraform-mariadb-parameter-group"
    family = "mariadb10.11"

    parameter {
        name = "max_connections"
        value = "150"
    }

    parameter {
        name = "time_zone"
        value = "Asia/Seoul"
    }

    parameter {
        name = "character_set_server"
        value = "utf8mb4"
    }

    parameter {
        name = "collation_server"
        value = "utf8mb4_unicode_ci"
    }
}

resource "aws_db_instance" "terraform-mariadb-rds" {
    identifier = "terraform-mariadb-rds-instance"
    allocated_storage = 20
    engine = "mariadb"
    engine_version = "10.11"
    instance_class = "db.t3.micro"
    db_name = "terraform_db"
    username = "root"
    password = "password1234"
    parameter_group_name = aws_db_parameter_group.terraform-mariadb-parameter-group.name
    db_subnet_group_name = aws_db_subnet_group.terraform-rds-subnet-group.name
    vpc_security_group_ids = [aws_security_group.terraform-sg-rds.id]
    skip_final_snapshot = true
}