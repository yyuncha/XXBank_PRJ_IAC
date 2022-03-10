module "sec-init-module" {
    source = "../../Management-Module/sec-init"

    cross_account_ADM = var.cross_account_ADM
    cross_account_OPS = var.cross_account_OPS

    IAM_Account_id = var.IAM_Account_id

    account_list = var.account_list

    tags = var.tags

    cmk_prd_ebs = var.cmk_prd_ebs
    cmk_prd_efs = var.cmk_prd_efs
    cmk_prd_s3 = var.cmk_prd_s3
    cmk_prd_rds = var.cmk_prd_rds
    cmk_log_s3 = var.cmk_log_s3

    cmk_ntw_ebs = var.cmk_ntw_ebs
    cmk_ntw_s3 = var.cmk_ntw_s3

    s3_accesslog_bucket = var.s3_accesslog_bucket

}

module "lambda-init-module" {
    source = "../../Management-Module/lambda-init"

    lambda_role = var.lambda_role
    lambda_inline_policy = var.lambda_inline_policy

    cmk_log_s3 = module.sec-init-module.cmk_log_s3
}

module "config-aggregator-module" {
    source = "../../Management-Module/config-aggregator"

    cmk_log_s3 = module.sec-init-module.cmk_log_s3
    s3_accesslog_bucket = var.s3_accesslog_bucket

    config_aggregator = var.config_aggregator
    account_list = var.account_list

    config_bucket = var.config_bucket
    config_recorder = var.config_recorder
    config_role = var.config_role

    LOG_Account_id = var.LOG_Account_id

    depends_on = [
        module.sec-init-module
    ]
}

module "guardduty-export-module" {
    source = "../../Management-Module/guardduty-master/export"

    providers = { aws = aws.log }

    guardduty_export_bucket = var.guardduty_export_bucket
    s3_accesslog_bucket = var.log_account_s3_accesslog_bucket
    cmk_log_s3 = module.sec-init-module.cmk_log_s3
}

module "guardduty-master-module" {
    source = "../../Management-Module/guardduty-master"

    account_list = var.account_list
   
    tags = var.tags

    guardduty_export_bucket = module.guardduty-export-module.guardduty_export_bucket
    cmk_log_s3 = module.sec-init-module.cmk_log_s3

    depends_on = [
        module.guardduty-export-module
    ]
}

module "cloudtrail-module" {
    source = "../../Management-Module/cloudtrail-managed"

    cmk_log_s3 = module.sec-init-module.cmk_log_s3
    s3_accesslog_bucket = var.s3_accesslog_bucket

    cloudtrail_bucket = var.cloudtrail_bucket
    cloudtrail_name = var.cloudtrail_name

    LOG_Account_id = var.LOG_Account_id

    depends_on = [
        module.sec-init-module
    ]
}
