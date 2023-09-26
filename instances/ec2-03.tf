module "vpc" {
  source = "../module-vpc"
}

resource "aws_instance" "web-app" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type["dev"]
  key_name      = var.key_name
  subnet_id     = module.vpc.public_subnets[0]
  #security_groups = ["${aws_security_group.ssh.id}", "${aws_security_group.web.id}"]
}

resource "aws_instance" "app" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type["dev"]
  subnet_id     = module.vpc.private_subnets[0]
}
/*
#create a RDS Database Instance
resource "aws_db_instance" "infra-db" {
  engine                 = "mysql"
  identifier             = "myrdsinstance"
  allocated_storage      = 20
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  username               = "myrdsuser"
  password               = "myrdspassword"
  parameter_group_name   = "default.mysql5.7"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  db_subnet_group_name   = module.vpc.db_subnet_group
  skip_final_snapshot    = true
  publicly_accessible    = false

}
*/