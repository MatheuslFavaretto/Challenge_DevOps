terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0"
    }
  }

  required_version = ">= 0.14.9"
}
provider "aws" {
  region  = "us-east-1"
}

# Backend para armazenar o estado do Terraform
