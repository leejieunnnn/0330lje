terraform {
    backend "s3" {
        bucket = "996549485893soldesk"
        key = "terraform/state/terraform.tfstate"
        region = "ap-northeast-2"
    }
}