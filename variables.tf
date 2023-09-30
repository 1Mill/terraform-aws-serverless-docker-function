# ! Depricated and will be removed in the next major release.
variable "policy" {
	default = null
	description = "JSON formatted AWS Policy"
	type = string
}
# ! ---

variable "docker" {
	description = "Docker build context."
	type = object({
		build = string
	})
}

variable "environment" {
	description = "Environmental variables."
	default = {}
        type = any
}

variable "function" {
	description = "AWS Lambda configuration."
	type = object({
		memory = optional(string, 128)
		name = string
		timeout = optional(string, 3)
		version = optional(string)
	})
}

variable "policies" {
	default = []
	description = "List of JSON formatted AWS Policies"
	type = list(string)
}

variable "registry" {
	description = "AWS ECR configuration."
	default = {}
	type = object({
		keep_count = optional(number, 2)
		name = optional(string)
	})

	validation {
		condition     = var.registry.keep_count >= 1
		error_message = "The registry.keep_count must be a positive integer."
	}
}
