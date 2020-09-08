resource "aws_lambda_function" "prod_lambda" {
function_name    = var.s3_sync_lambda
role             = aws_iam_role.role.arn
handler          = "${var.handler_name}.lambda_handler"
runtime          = var.runtime
timeout          = var.timeout
filename         = "s3_sync.zip"
source_code_hash = filebase64sha256("${var.handler_name}.zip")
environment {
   variables = {
    CreatedBy = "Terraform"}
}
}

resource "aws_s3_bucket_notification" "aws-lambda-trigger" {
bucket = aws_s3_bucket.bucket_b.id
lambda_function {
lambda_function_arn = aws_lambda_function.prod_lambda.arn
events              = ["s3:ObjectCreated:*"]
filter_prefix       = ""
filter_suffix       = ""
}
}

resource "aws_lambda_permission" "prod_lambda" {
statement_id  = "AllowS3Invoke"
action        = "lambda:InvokeFunction"

function_name = var.s3_sync_lambda
principal = "s3.amazonaws.com"
source_arn = "arn:aws:s3:::${aws_s3_bucket.bucket_b.id}"
}

output "arn" {
value = aws_lambda_function.prod_lambda.arn
}