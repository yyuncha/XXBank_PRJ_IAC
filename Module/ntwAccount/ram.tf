# 필요한 경우 추가 생성

variable ram_tgw_prd {
    type = string
}

variable ram_tgw_conprd {
    type = string
}

variable ram_tgw_shd {
    type = string
}



variable ram_tgw_prd_principals {
    type = list(string)
}


variable ram_tgw_conprd_principals {
    type = list(string)
}

variable ram_tgw_shd_principals {
    type = list(string)
}




////////수정 시작
//RAM 공유 생성
resource "aws_ram_resource_share" "ram_tgw_prd" {
    name = var.ram_tgw_prd
    allow_external_principals = true
    tags = merge({"Name" =  var.ram_tgw_prd}, var.tags)
}


resource "aws_ram_resource_share" "ram_tgw_conprd" {
    name = var.ram_tgw_conprd
    allow_external_principals = true
    tags = merge({"Name" =  var.ram_tgw_conprd}, var.tags)
}



resource "aws_ram_resource_share" "ram_tgw_shd" {
    name = var.ram_tgw_shd
    allow_external_principals = true
    tags = merge({"Name" =  var.ram_tgw_shd}, var.tags)
}



//RAM 공유 리소스 선택 (tgw)
resource "aws_ram_resource_association" "ram_tgw_prd_association" {
    resource_arn = aws_ec2_transit_gateway.tgw_prd.arn
    resource_share_arn  = aws_ram_resource_share.ram_tgw_prd.arn

    depends_on = [
        aws_ec2_transit_gateway.tgw_prd
    ]
}             


resource "aws_ram_resource_association" "ram_tgw_conprd_association" {
    resource_arn = aws_ec2_transit_gateway.tgw_conprd.arn
    resource_share_arn  = aws_ram_resource_share.ram_tgw_conprd.arn

    depends_on = [
        aws_ec2_transit_gateway.tgw_conprd
    ]
}

resource "aws_ram_resource_association" "ram_tgw_shd_association" {
    resource_arn = aws_ec2_transit_gateway.tgw_shd.arn
    resource_share_arn  = aws_ram_resource_share.ram_tgw_shd.arn

    depends_on = [
        aws_ec2_transit_gateway.tgw_shd
    ]
}


//RAM 리소스 공유 계정 선택
resource "aws_ram_principal_association" "ram_tgw_prd_principals" {
    count = length(var.ram_tgw_prd_principals)
    principal = var.ram_tgw_prd_principals[count.index]
    
    resource_share_arn = aws_ram_resource_share.ram_tgw_prd.arn
}

resource "aws_ram_principal_association" "ram_tgw_conprd_principals" {
    count = length(var.ram_tgw_conprd_principals)
    principal = var.ram_tgw_conprd_principals[count.index]
    
    resource_share_arn = aws_ram_resource_share.ram_tgw_conprd.arn
}

resource "aws_ram_principal_association" "ram_tgw_shd_principals" {
    count = length(var.ram_tgw_shd_principals)
    principal = var.ram_tgw_shd_principals[count.index]
    
    resource_share_arn = aws_ram_resource_share.ram_tgw_shd.arn
}

       


/*
resource "aws_ram_resource_share" "ram_transit_gateway_private" {
    name = var.ram_transit_gateway_private
    allow_external_principals = true
    tags = merge({"Name" =  var.ram_transit_gateway_private}, var.tags)
}

resource "aws_ram_resource_association" "ram_transit_gateway_private_association" {
    resource_arn = aws_ec2_transit_gateway.transit_gateway_private.arn
    resource_share_arn  = aws_ram_resource_share.ram_transit_gateway_private.arn

    depends_on = [
        aws_ec2_transit_gateway.transit_gateway_private
    ]
}

resource "aws_ram_principal_association" "ram_transit_gateway_private_principals" {
    count = length(var.ram_transit_gateway_private_principals)
    principal = var.ram_transit_gateway_private_principals[count.index]
    
    resource_share_arn = aws_ram_resource_share.ram_transit_gateway_private.arn
}
*/
