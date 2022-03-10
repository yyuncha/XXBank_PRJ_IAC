module "ntw-init-module" {
    source = "../../Management-Module/ntw-init"

    cross_account_ADM = var.cross_account_ADM
    cross_account_OPS = var.cross_account_OPS

    IAM_Account_id = var.IAM_Account_id

    tags = var.tags



    vpc_prd = var.vpc_prd
    vpc_conprd = var.vpc_conprd
    
    sbn_conprd_ext_1 = var.sbn_conprd_ext_1
    sbn_conprd_ext_2 = var.sbn_conprd_ext_2
    sbn_conprd_inn_1 = var.sbn_conprd_inn_1
    sbn_conprd_inn_2 = var.sbn_conprd_inn_2


    sbn_prd_ext_1 = var.sbn_prd_ext_1
    sbn_prd_ext_2 = var.sbn_prd_ext_2
    sbn_prd_utm_1 = var.sbn_prd_utm_1
    sbn_prd_utm_2 = var.sbn_prd_utm_2
    sbn_prd_lb_1 = var.sbn_prd_lb_1
    sbn_prd_lb_2 = var.sbn_prd_lb_2
    sbn_prd_inn_1 = var.sbn_prd_inn_1
    sbn_prd_inn_2 = var.sbn_prd_inn_2


    igw_prd = var.igw_prd



    rt_prd_ext = var.rt_prd_ext
    rt_prd_pri1 = var.rt_prd_pri1
    rt_prd_pri2 = var.rt_prd_pri2

    rt_conprd_ext = var.rt_conprd_ext
    rt_conprd_inn = var.rt_conprd_inn


    nacl_prd_ext = var.nacl_prd_ext
    nacl_prd_inn = var.nacl_prd_inn
    nacl_prd_lb = var.nacl_prd_lb
    nacl_prd_utm = var.nacl_prd_utm
    nacl_conprd = var.nacl_conprd
    





    # 필요한 경우 추가 생성
    tgw_prd = var.tgw_prd
    #tgw_dev = var.tgw_dev
    tgw_conprd = var.tgw_conprd
    #tgw_condev = var.tgw_condev
    tgw_shd = var.tgw_shd
  
  #  customer_gateway_private = var.customer_gateway_private
  

    ram_tgw_prd = var.ram_tgw_prd
    #ram_tgw_dev = var.ram_tgw_dev
    ram_tgw_conprd = var.ram_tgw_conprd
    #ram_tgw_condev = var.ram_tgw_condev
    ram_tgw_shd = var.ram_tgw_shd

    ram_tgw_prd_principals = var.ram_tgw_prd_principals
    #ram_tgw_dev_principals = var.ram_tgw_dev_principals
    ram_tgw_conprd_principals = var.ram_tgw_conprd_principals
    #ram_tgw_condev_principals = var.ram_tgw_condev_principals
    ram_tgw_shd_principals = var.ram_tgw_shd_principals

    tgwatt_tgwprd_ntwac_prdvpc = var.tgwatt_tgwprd_ntwac_prdvpc
    #tgw_com_ntw_dev_att_ext = var.tgw_com_ntw_dev_att_ext
   # tgw_com_ntw_prd_att_vpn = var.tgw_com_ntw_prd_att_vpn
    tgwatt_tgwconprd_ntwacc_conprdvpc = var.tgwatt_tgwconprd_ntwacc_conprdvpc
    #tgw_com_ntw_condev_att_vpn = var.tgw_com_ntw_condev_att_vpn
   # tgw_com_ntw_dev_att_vpn = var.tgw_com_ntw_dev_att_vpn
   
    #vpn_attachment = var.vpn_attachment

    s3_accesslog_bucket = var.s3_accesslog_bucket
}

module "lambda-init-module" {
    source = "../../Management-Module/lambda-init"

    lambda_role = var.lambda_role
    lambda_inline_policy = var.lambda_inline_policy

    cmk_log_s3 = data.terraform_remote_state.sec.outputs.cmk_log_s3
}

/*
module "hosted-zone-module" {
    source = "../../Management-Module/hosted-zone-managed"

    vpc = module.ntw-init-module.vpc
    subnet_inn_1 = module.ntw-init-module.subnet_inn_1
    subnet_inn_2 = module.ntw-init-module.subnet_inn_2

    hosted_zone_public = var.hosted_zone_public
    hosted_zone_private = var.hosted_zone_private

    main_dns_server_list = var.main_dns_server_list

    resolver_rules = var.resolver_rules

    inbound_ep_resolver = var.inbound_ep_resolver
    outbound_ep_resolver = var.outbound_ep_resolver

    ram_resolver_rules = var.ram_resolver_rules
    ram_resolver_rules_principals = var.ram_resolver_rules_principals

    tags = var.tags
}
*/
module "config-module" {
    source = "../../Management-Module/config-managed"

    cmk_log_s3 = data.terraform_remote_state.sec.outputs.cmk_log_s3
    s3_accesslog_bucket = var.s3_accesslog_bucket

    Security_Account_id = var.Security_Account_id
    
    config_bucket = var.config_bucket
    config_recorder = var.config_recorder
    config_role = var.config_role

    LOG_Account_id = var.LOG_Account_id

    depends_on = [
        module.ntw-init-module
    ]
}

module "guardduty-member-module" {
    source = "../../Management-Module/guardduty-member"

    Security_Account_id = var.Security_Account_id
}

module "cloudtrail-module" {
    source = "../../Management-Module/cloudtrail-managed"

    cmk_log_s3 = data.terraform_remote_state.sec.outputs.cmk_log_s3
    s3_accesslog_bucket = var.s3_accesslog_bucket

    cloudtrail_bucket = var.cloudtrail_bucket
    cloudtrail_name = var.cloudtrail_name

    LOG_Account_id = var.LOG_Account_id

    depends_on = [
        module.ntw-init-module
    ]
}

module "flowlog-module" {
    source = "../../Management-Module/flowlog-managed"

    cmk_log_s3 = data.terraform_remote_state.sec.outputs.cmk_log_s3
    s3_accesslog_bucket = var.s3_accesslog_bucket

    flowlog_bucket = var.flowlog_bucket
    vpc = module.ntw-init-module.vpc_prd
    flowlog_name = var.flowlog_name
    tags = var.tags

    LOG_Account_id = var.LOG_Account_id

    depends_on = [
        module.ntw-init-module
    ]
}