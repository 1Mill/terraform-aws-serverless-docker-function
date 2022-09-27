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
variable "policy" {
	default = null
	description = "JSON formatted AWS Policy"
	type = string
}
variable "registry" {
	description = "AWS ECR configuration."
	default = {}
	type = object({
		name = optional(string)
	})
}
