provider "aws" {
  version = "3.3.0"

  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

provider "rancher2" {
  api_url = var.api_url
  token_key = var.token_key
}

terraform{
  required_providers {
    rancher2 = {
      source = "rancher/rancher2"
    }
  }
  required_version = ">= 0.13"
}
