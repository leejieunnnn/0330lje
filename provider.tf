provider "aws" {
    region = "ap-northeast-2"
}

terraform {
    backend "s3" {
        bucket = "90022760icy-0331-2026"
        key = "terraform/state.tfstate"
        region = "ap-northeast-2"
        #dynamodb_table = "terraform-lock"
    }
}