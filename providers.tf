terraform {
	experiments = [
		module_variable_optional_attrs
	]

	required_providers {
		aws = {
			# ! Before v4.22 we could delete any ECR instance, even if if it contained
			# ! images still. In v4.22 we must now set "force_delete" to "true" to
			# ! maintain this behavior.
			# TODO: Make "force_delete" accessible through "terraform-aws-modules/lambda"
			# TODO: to avoid breaking change when deleting ECR instances that contain images
			source = "hashicorp/aws"
			version = "~> 4.0, < 4.22"
		}
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
