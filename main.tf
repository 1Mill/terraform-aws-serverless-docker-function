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
	source  = "terraform-aws-modules/lambda/aws//modules/docker-build"
	version = "~> 6.0.0"

	create_ecr_repo      = true
	ecr_repo             = var.registry.name != null ? var.registry.name : var.function.name
	image_tag            = var.function.version
	image_tag_mutability = "IMMUTABLE"
	keep_remotely        = true
	source_path          = var.docker.build

	ecr_repo_lifecycle_policy = jsonencode({
		rules = [
			{
				action       = { type = "expire" }
				description  = "Keep only the ${var.registry.keep_count} newest builds"
				rulePriority = 1

				selection = {
					countNumber = var.registry.keep_count
					countType   = "imageCountMoreThan"
					tagStatus   = "any"
				}
			}
		]
	})
}

locals {
	policies = compact(concat([var.policy], var.policies))
}

module "lambda" {
	source  = "terraform-aws-modules/lambda/aws"
	version = "~> 6.0.0"

	create_package        = false
	environment_variables = var.environment
	function_name         = var.function.name
	image_uri             = module.docker_image.image_uri
	memory_size           = var.function.memory
	package_type          = "Image"
	timeout               = var.function.timeout

	attach_policy_jsons    = length(local.policies) >= 1
	number_of_policy_jsons = length(local.policies)
	policy_jsons           = local.policies
}
