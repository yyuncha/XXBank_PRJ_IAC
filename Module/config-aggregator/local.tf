locals {
    log = element(lookup(var.account_list, "log", [null, null]),0)
    ntw = element(lookup(var.account_list, "ntw", [null, null]),0)
    shd = element(lookup(var.account_list, "shd", [null, null]),0)
    iam = element(lookup(var.account_list, "iam", [null, null]),0)
    prd = element(lookup(var.account_list, "prd", [null, null]),0)
    stg = element(lookup(var.account_list, "stg", [null, null]),0)
    dev = element(lookup(var.account_list, "dev", [null, null]),0)
}