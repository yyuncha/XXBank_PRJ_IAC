output cross_account_ADM {
    value = aws_iam_role.cross_account_ADM.arn
}

output cross_account_OPS {
    value = aws_iam_role.cross_account_OPS.arn
}

output vpc_prd {
    value = aws_vpc.vpc_prd.id
}

output vpc_conprd {
    value = aws_vpc.vpc_conprd.id
}















output sbn_prd_ext_1 {
    value = aws_subnet.sbn_prd_ext_1.id
}

output sbn_prd_ext_2 {
    value = aws_subnet.sbn_prd_ext_2.id
}

output sbn_prd_utm_1 {
    value = aws_subnet.sbn_prd_utm_1.id
}

output sbn_prd_utm_2 {
    value = aws_subnet.sbn_prd_utm_2.id
}

output sbn_prd_lb_1 {
    value = aws_subnet.sbn_prd_lb_1.id
}

output sbn_prd_lb_2 {
    value = aws_subnet.sbn_prd_lb_2.id
}

output sbn_prd_inn_1 {
    value = aws_subnet.sbn_prd_inn_1.id
}

output sbn_prd_inn_2 {
    value = aws_subnet.sbn_prd_inn_2.id
}



output sbn_conprd_ext_1 {
    value = aws_subnet.sbn_conprd_ext_1.id
}

output sbn_conprd_ext_2 {
    value = aws_subnet.sbn_conprd_ext_2.id
}

output sbn_conprd_inn_1 {
    value = aws_subnet.sbn_conprd_inn_1.id
}

output sbn_conprd_inn_2 {
    value = aws_subnet.sbn_conprd_inn_2.id
}



output igw_prd {
    value = aws_internet_gateway.igw_prd.id
}

/*
output transit_gateway_shared {
    value = aws_ec2_transit_gateway.transit_gateway_shared.id
}
*/
output tgw_prd {
    value = aws_ec2_transit_gateway.tgw_prd.id
}


output tgw_conprd {
    value = aws_ec2_transit_gateway.tgw_conprd.id
}

output tgw_shd {
    value = aws_ec2_transit_gateway.tgw_shd.id
}

/*
output ram_transit_gateway_shared {
    value = aws_ram_resource_share.ram_transit_gateway_shared.id
}
*/
output ram_tgw_prd {
    value = aws_ram_resource_share.ram_tgw_prd.id
}


output ram_tgw_conprd {
    value = aws_ram_resource_share.ram_tgw_conprd.id
}


output ram_tgw_shd {
    value = aws_ram_resource_share.ram_tgw_shd.id
}






output tgwatt_tgwprd_ntwac_prdvpc {
    value = aws_ec2_transit_gateway_vpc_attachment.tgwatt_tgwprd_ntwac_prdvpc.id
}


output tgwatt_tgwconprd_ntwacc_conprdvpc {
    value = aws_ec2_transit_gateway_vpc_attachment.tgwatt_tgwconprd_ntwacc_conprdvpc.id
}



/*
output tgw_com_ntw_prd_att_vpn {
    value = aws_ec2_transit_gateway_vpc_attachment.tgw_com_ntw_prd_att_vpn.id
}
*/

/*
output tgw_com_ntw_dev_att_vpn {
    value = aws_ec2_transit_gateway_vpc_attachment.tgw_com_ntw_dev_att_vpn.id
}
*/


output s3_accesslog_bucket{
    value = aws_s3_bucket.s3_accesslog_bucket.arn
}