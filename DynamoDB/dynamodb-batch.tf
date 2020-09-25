resource "aws_dynamodb_table" "dynamodb-tf-table" {
  name           = "DynamoDB-tf-batch"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "HEX"
  range_key      = "Name"

  attribute {
    name = "Name"
    type = "S"
  }

  attribute {
    name = "HEX"
    type = "S"
  }


  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  global_secondary_index {
    name               = "UserTitleIndex"
    hash_key           = "HEX"
    range_key          = "Name"
    write_capacity     = 30
    read_capacity      = 30
    projection_type    = "INCLUDE"
    non_key_attributes = ["UserId"]
  }

  tags = {
    Name        = "dynamodb-tf-batch"
    Environment = "Training"
  }
}

