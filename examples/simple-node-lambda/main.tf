module "serverless-docker-function" {
	source  = "1Mill/serverless-docker-function/aws"
	version = "0.0.3"

	docker = { build = abspath(path.module) }
	environment = {
		MESSAGE = "Hello from the environment!"
		NODE_ENV = "production"
	}
	function = { name = "my-simple-node-lambda" }
}
