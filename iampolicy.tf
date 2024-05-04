# Execution role
resource "aws_iam_role" "lambda_execution_myrole" {
  name = "terraform-lambda-greetings-myrole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })
}

# Access policy
resource "aws_iam_policy" "lambda_s3_access_mypolicy" {
  name        = "terraform-lambda-s3-access-mypolicy"
  description = "Grants access to source and destination buckets"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = ["s3:GetObject"],
        Effect = "Allow",
        Resource = [
          "${aws_s3_bucket.src_bucket1.arn}/*"
        ]
        }, {
        Action = ["s3:PutObject"],
        Effect = "Allow",
        Resource = [
          "${aws_s3_bucket.dst_bucket1.arn}/*"
        ]
      }
    ]
  })
}

# Attaches the policy to the role
resource "aws_iam_role_policy_attachment" "s3_full_access_attachment" {
  policy_arn = aws_iam_policy.lambda_s3_access_mypolicy.arn
  role       = aws_iam_role.lambda_execution_myrole.name
}