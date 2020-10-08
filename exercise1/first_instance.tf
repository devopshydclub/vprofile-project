provider "aws" {
  region = "us-east-2"
  #   access_key = ""
  #   secret_key = ""	
}

resource "aws_instance" "intro" {
  ami                    = "ami-03657b56516ab7912"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-2a"
  key_name               = "dove-key"
  vpc_security_group_ids = ["sg-0780815f55104be8a"]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }
}
