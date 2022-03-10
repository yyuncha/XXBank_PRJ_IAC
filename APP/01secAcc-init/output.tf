output cross_account_ADM {
    value = module.sec-init-module.cross_account_ADM
}

output cross_account_OPS {
    value = module.sec-init-module.cross_account_OPS
}

output guardduty_primary{
    value = module.guardduty-master-module.guardduty_primary
}

output guardduty_member_prd{
    value = module.guardduty-master-module.guardduty_member_prd
}
output guardduty_member_ntw{
    value = module.guardduty-master-module.guardduty_member_ntw
}
output guardduty_member_log{
    value = module.guardduty-master-module.guardduty_member_log
}

output guardduty_member_iam{
    value = module.guardduty-master-module.guardduty_member_iam
}
output cmk_prd_ebs{
    value = module.sec-init-module.cmk_prd_ebs
}

output cmk_prd_efs{
    value = module.sec-init-module.cmk_prd_efs
}

output cmk_prd_s3{
    value = module.sec-init-module.cmk_prd_s3
}

output cmk_prd_rds{
    value = module.sec-init-module.cmk_prd_rds
}

output cmk_log_s3{
    value = module.sec-init-module.cmk_log_s3
}

output cmk_ntw_s3{
    value = module.sec-init-module.cmk_ntw_s3
}

output cmk_ntw_ebs{
    value = module.sec-init-module.cmk_ntw_ebs
}

output config_configuration_recorder {
    value = module.config-aggregator-module.config_configuration_recorder
}

output aggregator {
    value = module.config-aggregator-module.aggregator
}

output config_bucket {
    value = {
        name = var.config_bucket
        arn = module.config-aggregator-module.config_bucket
    }
}

output cloudtrail_bucket {
    value = {
        name = var.cloudtrail_bucket
        arn = module.cloudtrail-module.cloudtrail_bucket
    }
}

output lambda_role {
    value = module.lambda-init-module.lambda_role
}

output guardduty_export_bucket {
    value = {
        name = var.guardduty_export_bucket
        arn = module.guardduty-export-module.guardduty_export_bucket
    }
}

output s3_accesslog_bucket { 
    value = {
        name = var.s3_accesslog_bucket
        arn = module.sec-init-module.s3_accesslog_bucket
    }
}

output log_account_s3_accesslog_bucket {
    value = {
        name = var.log_account_s3_accesslog_bucket
        arn = module.guardduty-export-module.s3_accesslog_bucket
    }
}