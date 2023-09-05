# Changelog

## v3.0.0

* **Breaking changes**
  * Upgrade `terraform-aws-modules/lambda/aws` from `~> 5.3.0` to `~> 6.0.0` ([more details](https://github.com/terraform-aws-modules/terraform-aws-lambda/blob/master/CHANGELOG.md#600-2023-08-09))
    * This only impacts people using AWS SAM as part of their development process.

## v2.1.0

* Validate and expand constraints to perimt both `hashicorp/aws` `~> 4.0` and `~> 5.0`.

## v2.0.0

* **Breaking changes**
  * Upgrade `terraform-aws-modules/lambda/aws` from `~> 4.0.2` to `~> 5.3.0` which requires `kreuzwerker/docker ~> 3.0`.
* Document optional `policy` varaible in `README.md`.

## v1.0.0

* **Breaking changes**
  * Require `terraform ~> 1.3` because experimental `defaults()` method were removed and replaced `optional()` method.
* Bump `terraform-aws-modules` from `~> 4.0.0` to `~> 4.0.2`
* Fix spelling of "build"

## v0.0.8

* Re-add `hashicorp/aws ~> 4.0` constraint to avoid accidentally adopting breaking changes from major releases

## v0.0.7

* Upgrade `terraform-aws-modules/lambda/aws ~> 4.0.0` and `terraform-aws-modules/lambda/aws//modules/docker-build ~> 4.0.0` to fix bug with `hashicorp/aws >= 4.22`
* Remove `hashicorp/aws ~> 4.0, < 4.22` constraint

## v0.0.6

* Set `hashicorp/aws ~> 4.0, < 4.22` to avoid breaking changes with new `force_delete` argument for `aws_ecr_repository` resources
* Set `kreuzwerker/docker ~> 2.18` to always permit the whitelist pattern for `.dockerignore` files
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
