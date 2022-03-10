variable aws_profile_sec { type = string }
variable aws_profile_log { type = string }
variable aws_region { type = string }

variable cross_account_ADM {
    type = object({
        name = string
        policy = list(string)
    })
}

variable cross_account_OPS {
    type = object({
        name = string
        policy = list(string)
    })
}

variable IAM_Account_id {
    type = string
}

variable tags {
    type = map
}

variable config_bucket {
    type = string
}

variable cloudtrail_bucket {
    type = string
}

variable cloudtrail_name {
    type = string
}

variable config_recorder {
    type = string
}

variable config_role {
    type = string
}

variable config_aggregator {
    type = string
    default = null
}

variable account_list {
    type = map
}



variable cmk_prd_ebs {
    type = string
}

variable cmk_prd_efs {
    type = string
}

variable cmk_prd_s3 {
    type = string
}

variable cmk_prd_rds {
    type = string
}
variable cmk_log_s3 {
    type = string
}

variable cmk_ntw_s3 {
    type = string
}

variable cmk_ntw_ebs {
    type = string
}
variable LOG_Account_id {
    type = string
}

variable lambda_role {
    type = string
}

variable lambda_inline_policy {
    type = string
}

variable guardduty_export_bucket {
    type = string
}

variable s3_accesslog_bucket {
    type = string
}

variable log_account_s3_accesslog_bucket {
    type = string
}