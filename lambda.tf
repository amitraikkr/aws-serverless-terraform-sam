# Create a zip file with function code
data "archive_file" "lambda_zip-1" {
  type        = "zip"
  source_file = "index.mjs"
  output_path = "lambda1.zip"
}

# Create a Lambda function
resource "aws_lambda_function" "greeting_lambda" {
  function_name = "greetings-mylambda-function"

  handler     = "index.handler"
  runtime     = "nodejs18.x"
  memory_size = 256
  role        = aws_iam_role.lambda_execution_myrole.arn

  environment {
    variables = {
      SRC_BUCKET = aws_s3_bucket.src_bucket1.id,
      DST_BUCKET = aws_s3_bucket.dst_bucket1.id
    }
  }

  filename         = data.archive_file.lambda_zip-1.output_path
  source_code_hash = data.archive_file.lambda_zip-1.output_base64sha256
}