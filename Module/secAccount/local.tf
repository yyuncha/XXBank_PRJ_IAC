locals {
    cmk_log_share_json = templatefile("${path.module}/cmk_log_share.json",
                                { 
                                    log = element(lookup(var.account_list, "log", [null, null]),0),
                                    ntw = element(lookup(var.account_list, "ntw", [null, null]),0),
                                    #shd = element(lookup(var.account_list, "shd", [null, null]),0),
                                    iam = element(lookup(var.account_list, "iam", [null, null]),0),
                                    prd = element(lookup(var.account_list, "prd", [null, null]),0),
                                    #dev = element(lookup(var.account_list, "dev", [null, null]),0),
                                    sec = data.aws_caller_identity.current.account_id
                                    #stg = element(lookup(var.account_list, "stg", [null, null]),0),
                                    #prd2 = element(lookup(var.account_list, "prd2", [null, null]),0), #cha
                                    #dev2 = element(lookup(var.account_list, "dev2", [null, null]),0), #cha
                                } 
                         )
/*
    cmk_shd_share_json = templatefile("${path.module}/cmk_shd_share.json",
                                { 
                                    shd = element(lookup(var.account_list, "shd", [null, null]),0),
                                    sec = data.aws_caller_identity.current.account_id
                                }
                         )
*/
    cmk_prd_share_json = templatefile("${path.module}/cmk_prd_share.json",
                                { 
                                    prd = element(lookup(var.account_list, "prd", [null, null]),0),
                                    sec = data.aws_caller_identity.current.account_id
                                }
                         )
/*
    cmk_stg_share_json = templatefile("${path.module}/cmk_stg_share.json",
                                { 
                                    stg = element(lookup(var.account_list, "stg", [null, null]),0),
                                    sec = data.aws_caller_identity.current.account_id
                                }
                         )

    cmk_dev_share_json = templatefile("${path.module}/cmk_dev_share.json",
                                { 
                                    dev = element(lookup(var.account_list, "dev", [null, null]),0),
                                    sec = data.aws_caller_identity.current.account_id
                                }
                         )
*/
    cmk_ntw_share_json = templatefile("${path.module}/cmk_ntw_share.json",
                                { 
                                    ntw = element(lookup(var.account_list, "ntw", [null, null]),0),
                                    sec = data.aws_caller_identity.current.account_id
                                }
                         )
    
    #cha
/*
    cmk_prd2_share_json = templatefile("${path.module}/cmk_prd2_share.json",
                                { 
                                    prd2 = element(lookup(var.account_list, "prd2", [null, null]),0),
                                    sec = data.aws_caller_identity.current.account_id
                                }
                         )


    cmk_dev2_share_json = templatefile("${path.module}/cmk_dev2_share.json",
                                { 
                                    dev = element(lookup(var.account_list, "dev2", [null, null]),0),
                                    sec = data.aws_caller_identity.current.account_id
                                }
                         )

    #cha
*/
}