provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "demo" {
  bucket = "gajanan-jenkins2-demo-bucket"
}
