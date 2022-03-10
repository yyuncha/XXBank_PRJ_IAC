aws_profile_sec = "test-sec"
aws_profile_log = "test-log"
aws_region = "ap-northeast-2"

cross_account_ADM = {
    name = "TEST-SEC-ROL-SYSADM"
    policy = [
        "arn:aws:iam::aws:policy/AdministratorAccess"
    ]
}

cross_account_OPS = {
    name = "TEST-SEC-ROL-SYSOPS"
    policy = [
        "arn:aws:iam::aws:policy/ReadOnlyAccess"
    ]  
}

IAM_Account_id = "11111"

tags = {
    Stage = "SEC"
    Org = ""
    Service = "LandingZone"
    Owner = ""
    Project = "Pilot"
    No_managed = "TRUE"
    History = "initial"
}

config_bucket = "test-an2-sec-s3-config3"
cloudtrail_bucket = "test-an2-sec-s3-cloudtrail3"

cloudtrail_name = "TEST-AN2-SEC-CTR"
config_recorder = "TEST-AN2-SEC-CNF"
config_role = "TEST-SEC-ROL-CONFIG"

config_aggregator = "aggregator"

account_list = {

    ntw = ["22222", "ntwshtest003@gmail.com"]
    log = ["33333", "logshtest005@gmail.com"]
    iam = ["11111", "iamshtest002@gmail.com"]
    prd = ["44444", "ofdprdshtest006@gmail.com"]
  
}


guardduty_export_bucket = "test-an2-log-s3-guardduty-export-test"

cmk_prd_ebs = "TEST-SEC-KMS-PRD-EBS"
cmk_prd_efs = "TEST-SEC-KMS-PRD-EFS"
cmk_prd_s3 = "TEST-SEC-KMS-PRD-S3"
cmk_prd_rds = "TEST-SEC-KMS-PRD-RDS"


cmk_log_s3 = "TEST-SEC-KMS-LOG-S3"
cmk_ntw_ebs = "TEST-SEC-KMS-NTW-EBS"
cmk_ntw_s3 = "TEST-SEC-KMS-NTW-S3"


LOG_Account_id = "33333"

lambda_role = "TEST-SEC-ROL-LAMBDA"
lambda_inline_policy = "TEST-SEC-POL-LAMBDA"

s3_accesslog_bucket = "test-an2-sec-s3-s3accesslog-test"
log_account_s3_accesslog_bucket = "test-an2-log-s3-s3accesslog-test"

