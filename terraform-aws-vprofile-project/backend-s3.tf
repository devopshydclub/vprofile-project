terraform {
  backend "s3" {
    bucket = "terra-vprofile-state11"
    key    = "terraform/backend"
    region = "us-east-2"
  }
}