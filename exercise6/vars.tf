variable REGION {
  default = "us-east-2"
}

variable ZONE1 {
  default = "us-east-2a"
}

variable ZONE2 {
  default = "us-east-2b"
}

variable ZONE3 {
  default = "us-east-2c"
}

variable AMIS {
  type = map
  default = {
    us-east-2 = "ami-03657b56516ab7912"
    us-east-1 = "ami-0947d2ba12ee1ff75"
  }
}

variable USER {
  default = "ec2-user"
}

variable PUB_KEY {
  default = "dovekey.pub"
}

variable PRIV_KEY {
  default = "dovekey"
}

variable MYIP {
  default = "183.83.67.89/32"
}
