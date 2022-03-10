output cross_account_ADM {
    value = aws_iam_role.cross_account_ADM.arn
}

output cross_account_OPS {
    value = aws_iam_role.cross_account_OPS.arn
}

output cmk_prd_ebs{
    value = aws_kms_key.cmk_prd_ebs.arn
}

output cmk_prd_efs{
    value = aws_kms_key.cmk_prd_efs.arn
}

output cmk_prd_s3{
    value = aws_kms_key.cmk_prd_s3.arn
}

output cmk_prd_rds{
    value = aws_kms_key.cmk_prd_rds.arn
}
/*
output cmk_stg_ebs{
    value = aws_kms_key.cmk_stg_ebs.arn
}

output cmk_stg_efs{
    value = aws_kms_key.cmk_stg_efs.arn
}

output cmk_stg_s3{
    value = aws_kms_key.cmk_stg_s3.arn
}

output cmk_stg_rds{
    value = aws_kms_key.cmk_stg_rds.arn
}

output cmk_dev_ebs{
    value = aws_kms_key.cmk_dev_ebs.arn
}

output cmk_dev_efs{
    value = aws_kms_key.cmk_dev_efs.arn
}

output cmk_dev_s3{
    value = aws_kms_key.cmk_dev_s3.arn
}

output cmk_dev_rds{
    value = aws_kms_key.cmk_dev_rds.arn
}

output cmk_shd_ebs{
    value = aws_kms_key.cmk_shd_ebs.arn
}

output cmk_shd_efs{
    value = aws_kms_key.cmk_shd_efs.arn
}

output cmk_shd_s3{
    value = aws_kms_key.cmk_shd_s3.arn
}
*/
output cmk_log_s3{
    value = aws_kms_key.cmk_log_s3.arn
}

output cmk_ntw_s3{
    value = aws_kms_key.cmk_ntw_s3.arn
}

output cmk_ntw_ebs{
    value = aws_kms_key.cmk_ntw_ebs.arn
}

output s3_accesslog_bucket{
    value = aws_s3_bucket.s3_accesslog_bucket.arn
}

/*
#cha

output cmk_prd2_ebs{
    value = aws_kms_key.cmk_prd2_ebs.arn
}

output cmk_prd2_efs{
    value = aws_kms_key.cmk_prd2_efs.arn
}

output cmk_prd2_s3{
    value = aws_kms_key.cmk_prd2_s3.arn
}

output cmk_prd2_rds{
    value = aws_kms_key.cmk_prd2_rds.arn
}


output cmk_dev2_ebs{
    value = aws_kms_key.cmk_dev2_ebs.arn
}

output cmk_dev2_efs{
    value = aws_kms_key.cmk_dev2_efs.arn
}

output cmk_dev2_s3{
    value = aws_kms_key.cmk_dev2_s3.arn
}

output cmk_dev2_rds{
    value = aws_kms_key.cmk_dev2_rds.arn
}

#cha*/