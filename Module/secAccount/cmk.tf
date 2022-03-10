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
/*
variable cmk_stg_ebs {
    type = string
}

variable cmk_stg_efs {
    type = string
}

variable cmk_stg_s3 {
    type = string
}

variable cmk_stg_rds {
    type = string
}

variable cmk_dev_ebs {
    type = string
}

variable cmk_dev_efs {
    type = string
}

variable cmk_dev_s3 {
    type = string
}

variable cmk_dev_rds {
    type = string
}

variable cmk_shd_ebs {
    type = string
}

variable cmk_shd_efs {
    type = string
}

variable cmk_shd_s3 {
    type = string
}
*/
variable cmk_log_s3 {
    type = string
}

variable cmk_ntw_s3 {
    type = string
}

variable cmk_ntw_ebs {
    type = string
}


/*
variable cmk_prd2_ebs {
    type = string
}

variable cmk_prd2_efs {
    type = string
}

variable cmk_prd2_s3 {
    type = string
}

variable cmk_prd2_rds {
    type = string
}

variable cmk_dev2_ebs {
    type = string
}

variable cmk_dev2_efs {
    type = string
}

variable cmk_dev2_s3 {
    type = string
}

variable cmk_dev2_rds {
    type = string
}


*/

#기본값: 대칭키, kms,  싱글리전, 

resource "aws_kms_key" "cmk_prd_ebs" {
    policy = local.cmk_prd_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_prd_ebs}, var.tags)
}

resource "aws_kms_key" "cmk_prd_efs" {
    policy = local.cmk_prd_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_prd_efs}, var.tags)
}

resource "aws_kms_key" "cmk_prd_s3" {
    policy = local.cmk_prd_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_prd_s3}, var.tags)
}

resource "aws_kms_key" "cmk_prd_rds" {
    policy = local.cmk_prd_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_prd_rds}, var.tags)
}
/*
resource "aws_kms_key" "cmk_stg_ebs" {
    policy = local.cmk_stg_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_stg_ebs}, var.tags)
}

resource "aws_kms_key" "cmk_stg_efs" {
    policy = local.cmk_stg_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_stg_efs}, var.tags)
}

resource "aws_kms_key" "cmk_stg_s3" {
    policy = local.cmk_stg_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_stg_s3}, var.tags)
}

resource "aws_kms_key" "cmk_stg_rds" {
    policy = local.cmk_stg_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_stg_rds}, var.tags)
}

resource "aws_kms_key" "cmk_dev_ebs" {
    policy = local.cmk_dev_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_dev_ebs}, var.tags)
}

resource "aws_kms_key" "cmk_dev_efs" {
    policy = local.cmk_dev_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_dev_efs}, var.tags)
}

resource "aws_kms_key" "cmk_dev_s3" {
    policy = local.cmk_dev_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_dev_s3}, var.tags)
}

resource "aws_kms_key" "cmk_dev_rds" {
    policy = local.cmk_dev_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_dev_rds}, var.tags)
}

resource "aws_kms_key" "cmk_shd_ebs" {
    policy = local.cmk_shd_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_shd_ebs}, var.tags)
}

resource "aws_kms_key" "cmk_shd_efs" {
    policy = local.cmk_shd_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_shd_efs}, var.tags)
}

resource "aws_kms_key" "cmk_shd_s3" {
    policy = local.cmk_shd_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_shd_s3}, var.tags)
}
*/
resource "aws_kms_key" "cmk_log_s3" {
    policy = local.cmk_log_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_log_s3}, var.tags)
}

resource "aws_kms_key" "cmk_ntw_s3" {
    policy = local.cmk_ntw_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_ntw_s3}, var.tags)
}

resource "aws_kms_key" "cmk_ntw_ebs" {
    policy = local.cmk_ntw_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_ntw_ebs}, var.tags)
}

#cha
/*
resource "aws_kms_key" "cmk_prd2_ebs" {
    policy = local.cmk_prd_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_prd2_ebs}, var.tags)
}

resource "aws_kms_key" "cmk_prd2_efs" {
    policy = local.cmk_prd_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_prd2_efs}, var.tags)
}

resource "aws_kms_key" "cmk_prd2_s3" {
    policy = local.cmk_prd_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_prd2_s3}, var.tags)
}

resource "aws_kms_key" "cmk_prd2_rds" {
    policy = local.cmk_prd_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_prd2_rds}, var.tags)
}



resource "aws_kms_key" "cmk_dev2_ebs" {
    policy = local.cmk_dev_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_dev2_ebs}, var.tags)
}

resource "aws_kms_key" "cmk_dev2_efs" {
    policy = local.cmk_dev_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_dev2_efs}, var.tags)
}

resource "aws_kms_key" "cmk_dev2_s3" {
    policy = local.cmk_dev_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_dev2_s3}, var.tags)
}

resource "aws_kms_key" "cmk_dev2_rds" {
    policy = local.cmk_dev_share_json
    enable_key_rotation = true
    tags = merge({"Name" =  var.cmk_dev2_rds}, var.tags)
}

#cha
*/



# ------------------------------------------------------------------

resource "aws_kms_alias" "cmk_prd_ebs" {
    name          = "alias/${var.cmk_prd_ebs}"
    target_key_id = aws_kms_key.cmk_prd_ebs.key_id
}

resource "aws_kms_alias" "cmk_prd_efs" {
    name          = "alias/${var.cmk_prd_efs}"
    target_key_id = aws_kms_key.cmk_prd_efs.key_id
}

resource "aws_kms_alias" "cmk_prd_s3" {
    name          = "alias/${var.cmk_prd_s3}"
    target_key_id = aws_kms_key.cmk_prd_s3.key_id
}

resource "aws_kms_alias" "cmk_prd_rds" {
    name          = "alias/${var.cmk_prd_rds}"
    target_key_id = aws_kms_key.cmk_prd_rds.key_id
}
/*
resource "aws_kms_alias" "cmk_stg_ebs" {
    name          = "alias/${var.cmk_stg_ebs}"
    target_key_id = aws_kms_key.cmk_stg_ebs.key_id
}

resource "aws_kms_alias" "cmk_stg_efs" {
    name          = "alias/${var.cmk_stg_efs}"
    target_key_id = aws_kms_key.cmk_stg_efs.key_id
}

resource "aws_kms_alias" "cmk_stg_s3" {
    name          = "alias/${var.cmk_stg_s3}"
    target_key_id = aws_kms_key.cmk_stg_s3.key_id
}

resource "aws_kms_alias" "cmk_stg_rds" {
    name          = "alias/${var.cmk_stg_rds}"
    target_key_id = aws_kms_key.cmk_stg_rds.key_id
}

resource "aws_kms_alias" "cmk_dev_ebs" {
    name          = "alias/${var.cmk_dev_ebs}"
    target_key_id = aws_kms_key.cmk_dev_ebs.key_id
}

resource "aws_kms_alias" "cmk_dev_efs" {
    name          = "alias/${var.cmk_dev_efs}"
    target_key_id = aws_kms_key.cmk_dev_efs.key_id
}

resource "aws_kms_alias" "cmk_dev_s3" {
    name          = "alias/${var.cmk_dev_s3}"
    target_key_id = aws_kms_key.cmk_dev_s3.key_id
}

resource "aws_kms_alias" "cmk_dev_rds" {
    name          = "alias/${var.cmk_dev_rds}"
    target_key_id = aws_kms_key.cmk_dev_rds.key_id
}

resource "aws_kms_alias" "cmk_shd_ebs" {
    name          = "alias/${var.cmk_shd_ebs}"
    target_key_id = aws_kms_key.cmk_shd_ebs.key_id
}

resource "aws_kms_alias" "cmk_shd_efs" {
    name          = "alias/${var.cmk_shd_efs}"
    target_key_id = aws_kms_key.cmk_shd_efs.key_id
}

resource "aws_kms_alias" "cmk_shd_s3" {
    name          = "alias/${var.cmk_shd_s3}"
    target_key_id = aws_kms_key.cmk_shd_s3.key_id
}
*/
resource "aws_kms_alias" "cmk_log_s3" {
    name          = "alias/${var.cmk_log_s3}"
    target_key_id = aws_kms_key.cmk_log_s3.key_id
}

resource "aws_kms_alias" "cmk_ntw_s3" {
    name          = "alias/${var.cmk_ntw_s3}"
    target_key_id = aws_kms_key.cmk_ntw_s3.key_id
}

resource "aws_kms_alias" "cmk_ntw_ebs" {
    name          = "alias/${var.cmk_ntw_ebs}"
    target_key_id = aws_kms_key.cmk_ntw_ebs.key_id
}


#cha
/*
resource "aws_kms_alias" "cmk_prd2_ebs" {
    name          = "alias/${var.cmk_prd2_ebs}"
    target_key_id = aws_kms_key.cmk_prd2_ebs.key_id
}

resource "aws_kms_alias" "cmk_prd2_efs" {
    name          = "alias/${var.cmk_prd2_efs}"
    target_key_id = aws_kms_key.cmk_prd2_efs.key_id
}

resource "aws_kms_alias" "cmk_prd2_s3" {
    name          = "alias/${var.cmk_prd2_s3}"
    target_key_id = aws_kms_key.cmk_prd2_s3.key_id
}

resource "aws_kms_alias" "cmk_prd2_rds" {
    name          = "alias/${var.cmk_prd2_rds}"
    target_key_id = aws_kms_key.cmk_prd2_rds.key_id
}


resource "aws_kms_alias" "cmk_dev2_ebs" {
    name          = "alias/${var.cmk_dev2_ebs}"
    target_key_id = aws_kms_key.cmk_dev2_ebs.key_id
}

resource "aws_kms_alias" "cmk_dev2_efs" {
    name          = "alias/${var.cmk_dev2_efs}"
    target_key_id = aws_kms_key.cmk_dev2_efs.key_id
}

resource "aws_kms_alias" "cmk_dev2_s3" {
    name          = "alias/${var.cmk_dev2_s3}"
    target_key_id = aws_kms_key.cmk_dev2_s3.key_id
}

resource "aws_kms_alias" "cmk_dev2_rds" {
    name          = "alias/${var.cmk_dev2_rds}"
    target_key_id = aws_kms_key.cmk_dev2_rds.key_id
}

#cha
*/