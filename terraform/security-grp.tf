#----------------------------
# Security Groups
#----------------------------

# ALB
resource "aws_security_group" "alb" {
  name        = "vp-alb-sg"
  description = "Allow HTTP from everywhere"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow HTTP from everywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# Bastion Host
resource "aws_security_group" "bastion" {
  name        = "vp-bastion-sg"
  description = "Allow SSH from everywhere"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow SSH from everywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Tomcat Server
resource "aws_security_group" "tomcat" {
  name        = "vp-tomcat-sg"
  description = "Allow SSH from Bastion Host"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description     = "Allow SSH from Bastion Host"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  ingress {
    description     = "Allow traffic from ALB"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# Internal Servers
resource "aws_security_group" "internal" {
  name        = "vp-internal-sg"
  description = "Allow SSH from Tomcat Server"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description     = "Allow SSH from Ansible Server"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.tomcat.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

