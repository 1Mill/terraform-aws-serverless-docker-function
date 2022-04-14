# Terraform AWS Serverless Docker Function

## Inputs

| Name             | Description                                                      | Type   | Default          | Required |
|------------------|------------------------------------------------------------------|--------|------------------|----------|
| docker.build     | Absolute path to Dockerfile                                      | string |                  | Yes      |
| environment      | Environmental variables                                          | object | `{}`             | No       |
| function.memory  | Memory allocated to AWS Lambda function between 128 to 10,240 MB | string | `128`            | No       |
| function.name    | AWS Lambda function name                                         | string |                  | Yes      |
| function.timeout | AWS Lambda timeout after seconds                                 | string | `3`              | No       |
| function.version | AWS Lambda docker image version                                  | string | Current Datetime | No       |
| registry.name    | AWS ECR name                                                     | string | `function.name`  | No       |

## Usage

See [examples folder](https://github.com/1Mill/terraform-aws-serverless-docker-function/tree/main/examples) for full working examples.

```hcl
module "serverless_docker_function" {
  source  = "1Mill/serverless-docker-function/aws"

  docker = { build = abspath(path.module) }
  environment = { NODE_ENV = "production" }
  function = { name = "my-function-name" }
}
```

```hcl
module "serverless_docker_function" {
  source  = "1Mill/serverless-docker-function/aws"

  docker = { build = abspath("absolute/path/to/my/docker/build/context") }
  environment = {
    MY_API_KEY = "mysecretvalue"
    NODE_ENV = "production"
  }
  function = {
    memory = "128"
    name = "my-super-fast-lambda"
    timeout = "1"
    version = "v1.2.3"
  }
  registry = {
    name = "my-unique-registry-name"
  }
}
```
