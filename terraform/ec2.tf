#----------------------------
# EC2
#----------------------------

# Bastion Host
resource "aws_instance" "bastion" {

  ami                    = "ami-07200fa04af91f087"
  instance_type          = "t2.micro"
  key_name               = "EC2_Ubuntu"
  vpc_security_group_ids = [aws_security_group.bastion.id]
  subnet_id              = element(module.vpc.public_subnets, 0)

  tags = {
    Name      = "Bastion"
    Terraform = "true"
  }
}


# Tomcat
resource "aws_instance" "tomcat" {

  ami                    = "ami-0fd48c6031f8700df"
  instance_type          = "t2.micro"
  key_name               = "EC2_Ubuntu"
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.tomcat.id]
  subnet_id              = element(module.vpc.private_subnets, 0)
  user_data              = file("./user_data/tomcat.sh")

  tags = {
    Name      = "Tomcat"
    Terraform = "true"
  }
}

# Define local variables

locals {
  backend-name = ["MyMQL", "Memcache", "RabbitMQ"]

  centos_userdata_path = ["./user_data/mysql.sh", "./user_data/memcache.sh", "./user_data/rabbitmq.sh"]

}

# CentOS servers (MySQL, Memcache, RabbitMQ)
resource "aws_instance" "backend" {
  count = 3

  ami                    = "ami-0fd48c6031f8700df"
  instance_type          = "t2.micro"
  key_name               = "EC2_Ubuntu"
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.internal.id]
  subnet_id              = element(module.vpc.private_subnets, 0)
  user_data              = file(local.centos_userdata_path[count.index])

  tags = {
    Name      = local.backend-name[count.index]
    Terraform = "true"
  }
}