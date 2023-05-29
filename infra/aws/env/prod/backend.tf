terraform {
  backend "s3" {
    bucket = "matheus-devops-backup-test"
    key    = "prod/aws/terraform.tfstate"
    region = "us-east-1"
  }
}