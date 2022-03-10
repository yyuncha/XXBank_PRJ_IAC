terraform {
    backend "s3" {
        bucket          = "landingzone-terraform-s3"
        key             = "sec-init"
        region          = "ap-northeast-2"
        encrypt         = true
        dynamodb_table  = "landingzone-terraform-ddb3"
        profile         = "landing_test"
    }
}

provider "aws" {
    region  = var.aws_region
    profile = var.aws_profile_sec
}

provider "aws" {
    alias = "log"
    region  = var.aws_region
    profile = var.aws_profile_log
}
