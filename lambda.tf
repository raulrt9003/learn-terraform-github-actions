resource "aws_lambda_layer_version" "example_layer" {
  filename            = "layer_content.zip"
  layer_name          = "my_shared_library"
  compatible_runtimes = ["python3.9", "python3.10"]
  description         = "A layer containing shared utility functions"
}

resource "aws_lambda_function" "example_function" {
  function_name    = "my_decorated_function"
  filename         = "function_payload.zip"
  role             = "arn:aws:iam::123456789012:role/existing-lambda-role"
  handler          = "index.handler"
  runtime          = "python3.10"

  layers = [
    "arn:aws:lambda:us-east-1:123456789012:layer:my-existing-layer:1"
  ]
}
