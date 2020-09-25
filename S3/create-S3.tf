resource "aws_s3_bucket" "s3Bucket_Terraform2" {
  bucket = "test-terraform-bucket-anu2"
  acl    = "private"

  tags = {
    Name = "Terraform bucket2"
    Environment = "Dev"
  }

  versioning {
    enabled = true
  }
}
