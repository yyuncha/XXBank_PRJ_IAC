# 필요한 경우 추가 생성

//prd
/*
variable tgw_ofd_prd_att_ext {
    type = string
}
*/

//dev
/*
variable tgw_ofd_dev_att_ext {
    type = string
}
*/

variable tgwatt_tgwprd_ntwac_prdvpc{
    type = string
}


variable tgwatt_tgwconprd_ntwacc_conprdvpc {
    type = string
}

/*conprd
variable tgw_com_ntw_prd_att_vpn {
    type = string
}
*/
/*
variable tgw_com_shd_prd_att_conprd_vpn {
        type = string
}

variable tgw_ofd_prd_att_vpn {
        type = string
}
*/
//condev
/*
variable  tgw_com_ntw_dev_att_vpn{
        type = string
}
*/

/*
variable tgw_ofd_dev_att_vpn {
    type = string
}


variable tgw_com_shd_prd_att_condev_vpn {
        type = string
}
*/

//shd
/*
variable tgw_ofd_prd_att_shd {
    type = string
}

variable  tgw_ofd_dev_att_shd{
        type = string
}

variable tgw_com_shd_prd_att_shd {
        type = string
}
*/





/////////////////////// PRD ///////////////////////
resource "aws_ec2_transit_gateway_vpc_attachment" "tgwatt_tgwprd_ntwac_prdvpc" {
    transit_gateway_id = aws_ec2_transit_gateway.tgw_prd.id
    vpc_id = aws_vpc.vpc_prd.id
    subnet_ids = [
        aws_subnet.sbn_prd_inn_1.id,
        aws_subnet.sbn_prd_inn_2.id
    ]
    transit_gateway_default_route_table_association = false
    transit_gateway_default_route_table_propagation = false
    tags = merge({"Name" =  var.tgwatt_tgwprd_ntwac_prdvpc}, var.tags)

    depends_on = [
        aws_ec2_transit_gateway.tgw_prd,
        aws_vpc.vpc_prd,
        aws_subnet.sbn_prd_inn_1,
        aws_subnet.sbn_prd_inn_2
    ]
}
/*
/////////////////////// DEV ///////////////////////
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_com_ntw_dev_att_ext" {
    transit_gateway_id = aws_ec2_transit_gateway.tgw_dev.id
    vpc_id = aws_vpc.vpc_dev.id
    subnet_ids = [
        aws_subnet.sbn_dev_inn_1.id,
        aws_subnet.sbn_dev_inn_2.id
    ]
    transit_gateway_default_route_table_association = false
    transit_gateway_default_route_table_propagation = false
    tags = merge({"Name" =  var.tgw_com_ntw_dev_att_ext}, var.tags)

    depends_on = [
        aws_ec2_transit_gateway.tgw_dev,
        aws_vpc.vpc_dev,
        aws_subnet.sbn_dev_inn_1,
        aws_subnet.sbn_dev_inn_2
    ]
}
*/





/////////////////////// CON_PRD ///////////////////////
resource "aws_ec2_transit_gateway_vpc_attachment" "tgwatt_tgwconprd_ntwacc_conprdvpc" {
    transit_gateway_id = aws_ec2_transit_gateway.tgw_conprd.id
    vpc_id = aws_vpc.vpc_conprd.id
    subnet_ids = [
        aws_subnet.sbn_conprd_inn_1.id,
        aws_subnet.sbn_conprd_inn_2.id
    ]
    transit_gateway_default_route_table_association = false
    transit_gateway_default_route_table_propagation = false
    tags = merge({"Name" =  var.tgwatt_tgwconprd_ntwacc_conprdvpc}, var.tags)

    depends_on = [
        aws_ec2_transit_gateway.tgw_conprd,
        aws_vpc.vpc_conprd,
        aws_subnet.sbn_conprd_inn_1,
        aws_subnet.sbn_conprd_inn_2
    ]
}

/*
/////////////////////// CON_DEV ///////////////////////
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_com_ntw_condev_att_vpn" {
    transit_gateway_id = aws_ec2_transit_gateway.tgw_condev.id
    vpc_id = aws_vpc.vpc_dev.id
    subnet_ids = [
        aws_subnet.sbn_dev_inn_1.id,
        aws_subnet.sbn_dev_inn_2.id
    ]
    transit_gateway_default_route_table_association = false
    transit_gateway_default_route_table_propagation = false
    tags = merge({"Name" =  var.tgw_com_ntw_condev_att_vpn}, var.tags)

    depends_on = [
        aws_ec2_transit_gateway.tgw_condev,
        aws_vpc.vpc_dev,
        aws_subnet.sbn_dev_inn_1,
        aws_subnet.sbn_dev_inn_2
    ]
}



*/
























/////////////////////// CON_PRD ///////////////////////
/*
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_com_ntw_prd_att_vpn" {
    transit_gateway_id = aws_ec2_transit_gateway.tgw_conprd.id
    vpc_id = aws_vpc.vpc_prd.id
    subnet_ids = [
        aws_subnet.sbn_prd_inn_1.id,
        aws_subnet.sbn_prd_inn_2.id
    ]
    transit_gateway_default_route_table_association = false
    transit_gateway_default_route_table_propagation = false
    tags = merge({"Name" =  var.tgw_com_ntw_prd_att_vpn}, var.tags)

    depends_on = [
        aws_ec2_transit_gateway.tgw_conprd,
        aws_vpc.vpc_prd,
        aws_subnet.sbn_prd_inn_1,
        aws_subnet.sbn_prd_inn_2
    ]
}
*/


/////////////////////// CON_DEV ///////////////////////

/*
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_com_ntw_dev_att_vpn" {
    transit_gateway_id = aws_ec2_transit_gateway.tgw_condev.id
    vpc_id = aws_vpc.vpc_dev.id
    subnet_ids = [
        aws_subnet.sbn_dev_inn_1.id,
        aws_subnet.sbn_dev_inn_2.id
   ]
    transit_gateway_default_route_table_association = false
    transit_gateway_default_route_table_propagation = false
    tags = merge({"Name" =  var.tgw_com_ntw_dev_att_vpn}, var.tags)

    depends_on = [
        aws_ec2_transit_gateway.tgw_condev,
        aws_vpc.vpc_dev,
        aws_subnet.sbn_dev_inn_1,
        aws_subnet.sbn_dev_inn_2
    ]
}
*/




















/*
variable vpn_attachment {
    type = string
}
*/
/*
resource "aws_ec2_tag" "vpn_attachment" {
    resource_id = aws_vpn_connection.private_connection.transit_gateway_attachment_id
    key         = "Name"
    value       =  var.vpn_attachment

    depends_on = [
        aws_vpn_connection.private_connection
    ]
}
*/