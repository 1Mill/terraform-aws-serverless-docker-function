terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "~> 4.11"
		}
	}
}

data "aws_iam_policy_document" "this" {
	statement {
		actions = ["kms:Decrypt"]
		resources = ["*"]
		sid = "MyUniqueDescription"
	}
}
module "serverless-docker-function" {
	source  = "../.."

	docker = { build = abspath(path.module) }
	environment = {
		MESSAGE = "Hello from the environment!"
		NODE_ENV = "production"
	}
	function = {
		name = "my-simple-node-lambda"
		version = "v0.0.1"
	}
	policy = data.aws_iam_policy_document.this.json
}
