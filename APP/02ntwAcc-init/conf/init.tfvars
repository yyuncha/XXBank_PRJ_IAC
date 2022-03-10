aws_profile_ntw = "test-ntw"
aws_region = "ap-northeast-2"


cross_account_ADM = {
    name = "TEST-NTW-ROTESTL-SYSADM"
    policy = [
        "arn:aws:iam::aws:policy/AdministratorAccess"
    ]
}

cross_account_OPS = {
    name = "TEST-NTW-ROL-SYSOPS"
    policy = [
        "arn:aws:iam::aws:policy/ReadOnlyAccess"
    ]
}

IAM_Account_id = "11111"



vpc_prd ={
    cidr_block = "999.999.10.0/23"
    name = "TEST-AN2-COM-NTW-PRD-VPC"
}
vpc_conprd ={
    cidr_block = "999.999.38.0/24"
    name = "TEST-AN2-COM-NTW-CONPRD-VPC"
}



sbn_prd_ext_1 = ["ap-northeast-2a", "999.999.10.0/26", "TEST-AN2-COM-NTW-DEV-SBN-EXT-1"]
sbn_prd_ext_2 = ["ap-northeast-2c", "999.999.11.0/26", "TEST-AN2-COM-NTW-DEV-SBN-EXT-2"]
sbn_prd_utm_1 = ["ap-northeast-2a", "999.999.10.192/26", "TEST-AN2-COM-NTW-DEV-SBN-UTM-1"]
sbn_prd_utm_2 = ["ap-northeast-2c", "999.999.11.192/26", "TEST-AN2-COM-NTW-DEV-SBN-UTM-2"]
sbn_prd_lb_1 = ["ap-northeast-2a", "999.999.10.128/26", "TEST-AN2-COM-NTW-DEV-SBN-LB-1"]
sbn_prd_lb_2 = ["ap-northeast-2c", "999.999.11.128/26", "TEST-AN2-COM-NTW-DEV-SBN-LB-2"]
sbn_prd_inn_1 = ["ap-northeast-2a", "999.999.10.64/26", "TEST-AN2-COM-NTW-DEV-SBN-INN-1"]
sbn_prd_inn_2 = ["ap-northeast-2c", "999.999.11.64/26", "TEST-AN2-COM-NTW-DEV-SBN-INN-2"]

sbn_conprd_ext_1 = ["ap-northeast-2a", "999.999.38.0/26", "TEST-AN2-COM-NTW-CONPRD-SBN-EXT-1"]
sbn_conprd_ext_2 = ["ap-northeast-2c", "999.999.38.128/26", "TEST-AN2-COM-NTW-CONPRD-SBN-EXT-2"] 
sbn_conprd_inn_1 = ["ap-northeast-2a", "999.999.38.64/26", "TEST-AN2-COM-NTW-CONPRD-SBN-INN-1"] 
sbn_conprd_inn_2 = ["ap-northeast-2c", "999.999.38.192/26", "TEST-AN2-COM-NTW-CONPRD-SBN-INN-2"]

igw_prd = "TEST-AN2-COM-NTW-PRD-IGW"


nacl_conprd  = {
    name = "TEST-AN2-COM-NTW-PRD-NACL-EXT"
   
    ingresses = [
        [100, "-1", 0, 0, "0.0.0.0/0", "allow"]
    ]
    egresses = [
        [100, "-1", 0, 0, "0.0.0.0/0", "allow"]
    ]
}

nacl_prd_ext = {
    name = "TEST-AN2-COM-NTW-PRD-NACL-EXT"
   
    ingresses = [
        [100, "-1", 0, 0, "0.0.0.0/0", "allow"]
    ]
    egresses = [
        [100, "-1", 0, 0, "0.0.0.0/0", "allow"]
    ]
}

nacl_prd_inn = {
    name = "TEST-AN2-COM-NTW-PRD-NACL-INN"
  
    ingresses = [
        [100, "-1", 0, 0, "0.0.0.0/0", "allow"]
    ]
    egresses = [
        [100, "-1", 0, 0, "0.0.0.0/0", "allow"]
    ]
}


nacl_prd_lb = {
    name = "TEST-AN2-COM-NTW-PRD-NACL-LB"
   
    ingresses = [
        [100, "-1", 0, 0, "0.0.0.0/0", "allow"]
    ]
    egresses = [
        [100, "-1", 0, 0, "0.0.0.0/0", "allow"]
    ]
}

nacl_prd_utm = {
    name = "TEST-AN2-COM-NTW-PRD-NACL-UTM"
   
    ingresses = [
        [100, "-1", 0, 0, "0.0.0.0/0", "allow"]
    ]
    egresses = [
        [100, "-1", 0, 0, "0.0.0.0/0", "allow"]
    ]
}




//RT_CON_PRD
rt_conprd_ext = {
    name = "TEST-AN2-COM-NTW-CONPRD-RT-EXT"
    propagating_vgws = []
    routes = []
}

rt_conprd_inn = {
    name = "TEST-AN2-COM-NTW-CONPRD-RT-INN"
    propagating_vgws = []
    routes = []

}




// RT_PRD
rt_prd_ext = {
    name = "TEST-AN2-COM-NTW-PRD-RT-EXT"
    propagating_vgws = []
    routes = [
     
    ]
}
rt_prd_pri1 = {
    name = "TEST-AN2-COM-NTW-PRD-RT-PRI-1"
    propagating_vgws = []
    routes = [
      
    ]
}
rt_prd_pri2 = {
    name = "TEST-AN2-COM-NTW-PRD-RT-PRI-2"
    propagating_vgws = []
    routes = [
     
    ]
}




//TGW

tgw_prd = {
    name = "TEST-AN2-COM-NTW-PRD-TGW-EXT"
    amazon_side_asn = 64512
    description = "TEST-AN2-COM-NTW-PRD-TGW-EXT"
}
tgw_conprd = {
    name = "TEST-AN2-COM-NTW-CONPRD-TGW-VPN"
    amazon_side_asn = 64612
    description = "TEST-AN2-COM-NTW-CONPRD-TGW-VPN"
}

tgw_shd = {
    name = "TEST-AN2-COM-NTW-TGW-SHD"
    amazon_side_asn = 64712
    description = "TEST-AN2-COM-NTW-TGW-SHD"
}






# TGW RAM

ram_tgw_prd = "TEST-AN2-RAM-COM-NTW-PRD-TGW-EXT"
ram_tgw_prd_principals = [
    "44444" # PRD
]
ram_tgw_conprd = "TEST-AN2-RAM-COM-NTW-CONPRD-TGW-VPN"
ram_tgw_conprd_principals = [
    "44444", # PRD
    "33333"  # LOG
]
ram_tgw_shd = "TEST-AN2-RAM-COM-NTW-TGW-SHD"
ram_tgw_shd_principals = [
    "44444", # PRD
    "33333"  # LOG
]


# TGW ATT
tgwatt_tgwprd_ntwac_prdvpc = "TEST-AN2-COM-NTW-PRD-ATT-EXT"
tgwatt_tgwconprd_ntwacc_conprdvpc = "TEST-AN2-COM-NTW-CONPRD-ATT-VPN"



config_bucket = "test-an2-ntw-s3-config3"
cloudtrail_bucket = "test-an2-ntw-s3-cloudtrail3"
flowlog_bucket = "test-an2-ntw-s3-flowlog3"

cloudtrail_name = "TEST-AN2-NTW-CTR"
config_recorder = "TEST-AN2-NTW-CNF"
config_role = "TEST-NTW-ROL-CONFIG"
flowlog_name = "TEST-AN2-NTW-FLW"

Security_Account_id = "66666"
LOG_Account_id = "33333"

lambda_role = "TEST-NTW-ROL-LAMBDA"
lambda_inline_policy = "TEST-NTW-POL-LAMBDA"

s3_accesslog_bucket = "test-an2-ntw-s3-s3accesslog-test3"
