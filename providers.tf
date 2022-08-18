terraform {
	experiments = [
		module_variable_optional_attrs
	]

	required_providers {
		docker = {
			# * v2.18 enables the recommended white-list pattern in .dockerignore
			source = "kreuzwerker/docker"
			version = "~> 2.18"
		}
	}

	# ! Terraform v1.3 introduces a breaking change by throwing
	# ! an error when using experiment "module_variable_optional_attrs"
	# ! and by removing the "defaults(..., ...)" helper function
	required_version = "~> 1.0, < 1.3"
}
