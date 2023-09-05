output "arn" {
	description = "AWS Lambda ARN"
	value = module.lambda.lambda_function_arn
}

output "docker_image" {
        description = "AWS ECR resources"
        value = module.docker_image
}

output "lambda" {
        description = "AWS Lambda resources"
        value = module.lambda
}
