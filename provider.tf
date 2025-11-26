terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.16.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


terraform {
  backend "s3" {
    bucket         = "THE_NAME_OF_THE_STATE_BUCKET"
    key            = "youkey/path"
    region         = "us-east-1"

  }
}