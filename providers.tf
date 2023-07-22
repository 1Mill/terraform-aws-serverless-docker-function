terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "~> 4.0"
		}
		docker = {
			source = "kreuzwerker/docker"
			version = "~> 3.0"
		}
	}

	required_version = "~> 1.3"
}
