locals {
	function = defaults(var.function, {
		memory = 128
		timeout = 3
	})
	registry = defaults(var.registry, {
		name = local.function.name
	})
}

data "aws_caller_identity" "this" {}
data "aws_ecr_authorization_token" "token" {}
data "aws_region" "current" {}

provider "docker" {
  registry_auth {
    address  = format("%v.dkr.ecr.%v.amazonaws.com", data.aws_caller_identity.this.account_id, data.aws_region.current.name)
    password = data.aws_ecr_authorization_token.token.password
    username = data.aws_ecr_authorization_token.token.user_name
  }
}

module "docker_image" {
	source = "terraform-aws-modules/lambda/aws//modules/docker-build"
	version = "~> 4.0.0"

	create_ecr_repo = true
	ecr_repo = local.registry.name
	ecr_repo_lifecycle_policy = jsonencode({
		rules = [
			{
				action = { type = "expire" }
				description = "Keep the latest bulid"
				rulePriority = 1
				selection = {
					countNumber = 1
					countType = "imageCountMoreThan"
					tagStatus = "any"
				}
			}
		]
	})
	image_tag = local.function.version
	image_tag_mutability = "IMMUTABLE"
	source_path = var.docker.build
}

module "lambda" {
	source = "terraform-aws-modules/lambda/aws"
	version = "~> 4.0.0"

	create_package = false
	environment_variables = var.environment
	function_name = local.function.name
	image_uri = module.docker_image.image_uri
	memory_size = local.function.memory
	package_type = "Image"
	timeout = local.function.timeout

	attach_policy_json = var.policy != null
	policy_json = var.policy
}
