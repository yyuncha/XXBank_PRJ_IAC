/*
variable customer_gateway_private{
    type = object({
        name = string
        bgp_asn = number
        ip = string
    })
}

variable private_connection {
    type = string
}

resource "aws_customer_gateway" "customer_gateway_private" {
    device_name = var.customer_gateway_private.name
    bgp_asn = var.customer_gateway_private.bgp_asn
    ip_address = var.customer_gateway_private.ip
    type = "ipsec.1"
    tags = merge({"Name" =  var.customer_gateway_private.name}, var.tags)
}

resource "aws_vpn_connection" "private_connection" {
    customer_gateway_id = aws_customer_gateway.customer_gateway_private.id
    transit_gateway_id = aws_ec2_transit_gateway.transit_gateway_private.id
    type = aws_customer_gateway.customer_gateway_private.type

    tags = merge({"Name" =  var.private_connection}, var.tags)

    depends_on = [
        aws_ec2_transit_gateway.transit_gateway_private
    ]
}
*/