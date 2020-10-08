terraform {
  backend "s3" {
    bucket = "terra-state-dove"
    key    = "terraform/backend"
    region = "us-east-2"
  }
}
