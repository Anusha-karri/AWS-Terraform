provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "s3Bucket_Terraform1" {
  bucket = "test-terraform-bucket-anu1"
  acl    = "private"

  tags = {
    Name = "Terraform bucket"
    Environment = "Dev"
  }

  versioning {
    enabled = true
  }
}
