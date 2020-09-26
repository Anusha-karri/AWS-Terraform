locals {
  lambda_zip_loc = "outputs/lamda-script.py.zip"
}

data "archive_file" "welcome" {
  type        = "zip"
  source_file = "lamda-script.py"
  output_path = local.lambda_zip_loc
}



resource "aws_lambda_function" "test_lambda" {
  filename      = local.lambda_zip_loc
  function_name = "date_format"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lamda-script.date_format"

  source_code_hash = filebase64sha256("local.lambda_zip_loc")

  runtime = "python3.7"

}
