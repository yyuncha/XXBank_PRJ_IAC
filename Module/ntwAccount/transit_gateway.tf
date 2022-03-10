# 필요한 경우 추가 생성
variable tgw_prd {
    type = object({
        name = string
        amazon_side_asn = number
        description = string
    })
}

variable tgw_conprd {
    type = object({
        name = string
        amazon_side_asn = number
        description = string
    })
}

variable tgw_shd {
    type = object({
        name = string
        amazon_side_asn = number
        description = string
    })
}


resource "aws_ec2_transit_gateway" "tgw_prd" {
    amazon_side_asn = var.tgw_prd.amazon_side_asn
    default_route_table_association = "disable"
    default_route_table_propagation = "disable"
    description = var.tgw_prd.description
    vpn_ecmp_support = "disable"
    auto_accept_shared_attachments = "enable"
    tags = merge({"Name" =  var.tgw_prd.name}, var.tags)
}

resource "aws_ec2_transit_gateway" "tgw_conprd" {
    amazon_side_asn = var.tgw_conprd.amazon_side_asn
    default_route_table_association = "disable"
    default_route_table_propagation = "disable"
    description = var.tgw_conprd.description
    vpn_ecmp_support = "disable"
    auto_accept_shared_attachments = "enable"
    tags = merge({"Name" =  var.tgw_conprd.name}, var.tags)
}


resource "aws_ec2_transit_gateway" "tgw_shd" {
    amazon_side_asn = var.tgw_shd.amazon_side_asn
    default_route_table_association = "disable"
    default_route_table_propagation = "disable"
    description = var.tgw_shd.description
    vpn_ecmp_support = "disable"
    auto_accept_shared_attachments = "enable"
    tags = merge({"Name" =  var.tgw_shd.name}, var.tags)
}