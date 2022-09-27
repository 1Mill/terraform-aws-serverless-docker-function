terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "~> 4.0"
		}
		docker = {
			# * v2.18 enables the recommended white-list pattern in .dockerignore
			source = "kreuzwerker/docker"
			version = "~> 2.18"
		}
	}

	required_version = "~> 1.3"
}
