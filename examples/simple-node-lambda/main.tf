module "serverless-docker-function" {
	source  = "../.."

	docker = { build = abspath(path.module) }
	environment = {
		MESSAGE = "Hello from the environment!"
		NODE_ENV = "production"
	}
	function = { name = "my-simple-node-lambda" }
}
