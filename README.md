# Terraform AWS Serverless Docker Function

## Inputs

| Name             | Required | Type         | Default          | Description                                                      |
|------------------|----------|--------------|------------------|------------------------------------------------------------------|
| docker.build     | Yes      | string       |                  | Absolute path to Dockerfile                                      |
| environment      |          | object       | `{}`             | Environmental variables                                          |
| function.memory  |          | string       | `128`            | Memory allocated to AWS Lambda function between 128 to 10,240 MB |
| function.name    | Yes      | string       |                  | AWS Lambda function name                                         |
| function.timeout |          | string       | `3`              | AWS Lambda timeout after seconds                                 |
| function.version |          | string       | Current Datetime | AWS Lambda docker image version                                  |
| policies         |          | list(string) | `[]`             | List of AWS Policies formatted as JSON                           |
| registry.name    |          | string       | `function.name`  | AWS ECR name                                                     |

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

## Examples

1. Create `.env` file with your AWS credentials that match those in `docker-compose.yml`
1. Run `docker compose run terraform sh`
1. Inside the container, run `cd examples/simple-node-lambda`
1. In the example directory, run `terraform init` and then `terraform apply -auto-approve`
1. Destroy the resources by running `terraform destroy -auto-approve`
