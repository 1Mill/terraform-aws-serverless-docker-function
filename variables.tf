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
		memory = optional(string)
		name = string
		timeout = optional(string)
		version = optional(string)
	})
}
variable "registry" {
	description = "AWS ECR configuration."
	default = {}
	type = object({
		name = optional(string)
	})
}
