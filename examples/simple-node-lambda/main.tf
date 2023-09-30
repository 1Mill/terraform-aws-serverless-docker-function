terraform {
	required_version = "~> 1"

	required_providers {
		aws = {
			source  = "hashicorp/aws"
			version = "~> 5"
		}
	}
}

data "aws_iam_policy_document" "eventbridge" {
	statement {
		actions   = ["events:PutEvents"]
		effect    = "Allow"
		resources = ["*"]
		sid       = "MyAnotherUniqueDescription"
	}
}

data "aws_iam_policy_document" "kms" {
	statement {
		actions   = ["kms:Decrypt"]
		resources = ["*"]
		sid       = "MyUniqueDescription"
	}
}

module "serverless-docker-function" {
	source  = "../.."

	docker = {
		build = abspath(path.module)
	}
	environment = {
		MESSAGE  = "Hello from the environment!"
		NODE_ENV = "production"
	}
	function = {
		name = "my-simple-node-lambda"
	}
	policies = [
		data.aws_iam_policy_document.eventbridge.json,
		data.aws_iam_policy_document.kms.json,
	]
}
