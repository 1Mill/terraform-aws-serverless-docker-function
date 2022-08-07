# Changelog

## v0.0.6

* Set `hashicorp/aws ~> 4.0, < 4.22` to avoid breaking changes with new `force_delete` argument for AWS ECR instances
* Set `kreuzwerker/docker ~> 2.18` to always allow white-list `.dockerignore` pattern enabled with that release
* Set `terraform ~> 1.0, < 1.3` to avoid breaking changes with `module_variable_optional_attrs`

## v0.0.5

* Add optional JSON `policy` argument

## v0.0.4

* Remove the `var.docker = {}` default to make `var.docker` a required input

## v0.0.3

* Remove the default `var.docker.build = abspath(path.module)`
* Make `var.docker.build` a required argument

## v0.0.2

* Add descriptions to variables
* Update README with inputs and basic usage

## v0.0.1

* First commits
