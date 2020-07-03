provider "aws" {
  version = "~> 2.41"

  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

provider "rancher2" {
  api_url = var.api_url
  token_key = var.token_key
}