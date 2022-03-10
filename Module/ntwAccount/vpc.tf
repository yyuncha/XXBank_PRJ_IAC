

variable vpc_prd {
    type = object({
        cidr_block = string
        name = string
       
    })
}
variable vpc_conprd {
    type = object({
        cidr_block = string
        name = string
        
    })
}




variable sbn_prd_ext_1 {
    type = list(string)
}

variable sbn_prd_ext_2 {
    type = list(string)
}

variable sbn_prd_utm_1 {
    type = list(string)
}

variable sbn_prd_utm_2 {
    type = list(string)
}
variable sbn_prd_lb_1 {
    type = list(string)
}

variable sbn_prd_lb_2 {
    type = list(string)
}

variable sbn_prd_inn_1 {
    type = list(string)
}

variable sbn_prd_inn_2 {
    type = list(string)
}



variable sbn_conprd_ext_1 {
    type = list(string)
}

variable sbn_conprd_ext_2 {
    type = list(string)
}

variable sbn_conprd_inn_1 {
    type = list(string)
}

variable sbn_conprd_inn_2 {
    type = list(string)
}



variable igw_prd {
    type = string
}



resource "aws_vpc" "vpc_prd" {
    cidr_block = var.vpc_prd.cidr_block
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = merge({"Name" =  var.vpc_prd.name}, var.tags)
}


resource "aws_vpc" "vpc_conprd" {
    cidr_block = var.vpc_conprd.cidr_block
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = merge({"Name" =  var.vpc_conprd.name}, var.tags)
}


########### sbn

/*
############### SBN dev

resource "aws_subnet" "sbn_dev_ext_1" {
    availability_zone = var.sbn_dev_ext_1[0]
    cidr_block = var.sbn_dev_ext_1[1]
    vpc_id = aws_vpc.vpc_dev.id
    tags = merge({"Name" =  var.sbn_dev_ext_1[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_dev
    ]
}

resource "aws_subnet" "sbn_dev_ext_2" {
    availability_zone = var.sbn_dev_ext_2[0]
    cidr_block = var.sbn_dev_ext_2[1]
    vpc_id = aws_vpc.vpc_dev.id
    tags = merge({"Name" =  var.sbn_dev_ext_2[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_dev
    ]
}

resource "aws_subnet" "sbn_dev_utm_1" {
    availability_zone = var.sbn_dev_utm_1[0]
    cidr_block = var.sbn_dev_utm_1[1]
    vpc_id = aws_vpc.vpc_dev.id
    tags = merge({"Name" =  var.sbn_dev_utm_1[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_dev
    ]
}

resource "aws_subnet" "sbn_dev_utm_2" {
    availability_zone = var.sbn_dev_utm_2[0]
    cidr_block = var.sbn_dev_utm_2[1]
    vpc_id = aws_vpc.vpc_dev.id
    tags = merge({"Name" =  var.sbn_dev_utm_2[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_dev
    ]
}

resource "aws_subnet" "sbn_dev_lb_1" {
    availability_zone = var.sbn_dev_lb_1[0]
    cidr_block = var.sbn_dev_lb_1[1]
    vpc_id = aws_vpc.vpc_dev.id
    tags = merge({"Name" =  var.sbn_dev_lb_1[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_dev
    ]
}

resource "aws_subnet" "sbn_dev_lb_2" {
    availability_zone = var.sbn_dev_lb_2[0]
    cidr_block = var.sbn_dev_lb_2[1]
    vpc_id = aws_vpc.vpc_dev.id
    tags = merge({"Name" =  var.sbn_dev_lb_2[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_dev
    ]
}

resource "aws_subnet" "sbn_dev_inn_1" {
    availability_zone = var.sbn_dev_inn_1[0]
    cidr_block = var.sbn_dev_inn_1[1]
    vpc_id = aws_vpc.vpc_dev.id
    tags = merge({"Name" =  var.sbn_dev_inn_1[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_dev
    ]
}

resource "aws_subnet" "sbn_dev_inn_2" {
    availability_zone = var.sbn_dev_inn_2[0]
    cidr_block = var.sbn_dev_inn_2[1]
    vpc_id = aws_vpc.vpc_dev.id
    tags = merge({"Name" =  var.sbn_dev_inn_2[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_dev
    ]
}


*/

##### SBN prd

resource "aws_subnet" "sbn_prd_ext_1" {
    availability_zone = var.sbn_prd_ext_1[0]
    cidr_block = var.sbn_prd_ext_1[1]
    vpc_id = aws_vpc.vpc_prd.id
    tags = merge({"Name" =  var.sbn_prd_ext_1[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_prd
    ]
}

resource "aws_subnet" "sbn_prd_ext_2" {
    availability_zone = var.sbn_prd_ext_2[0]
    cidr_block = var.sbn_prd_ext_2[1]
    vpc_id = aws_vpc.vpc_prd.id
    tags = merge({"Name" =  var.sbn_prd_ext_2[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_prd
    ]
}


resource "aws_subnet" "sbn_prd_utm_1" {
    availability_zone = var.sbn_prd_utm_1[0]
    cidr_block = var.sbn_prd_utm_1[1]
    vpc_id = aws_vpc.vpc_prd.id
    tags = merge({"Name" =  var.sbn_prd_utm_1[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_prd
    ]
}


resource "aws_subnet" "sbn_prd_utm_2" {
    availability_zone = var.sbn_prd_utm_2[0]
    cidr_block = var.sbn_prd_utm_2[1]
    vpc_id = aws_vpc.vpc_prd.id
    tags = merge({"Name" =  var.sbn_prd_utm_2[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_prd
    ]
}


resource "aws_subnet" "sbn_prd_lb_1" {
    availability_zone = var.sbn_prd_lb_1[0]
    cidr_block = var.sbn_prd_lb_1[1]
    vpc_id = aws_vpc.vpc_prd.id
    tags = merge({"Name" =  var.sbn_prd_lb_1[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_prd
    ]
}


resource "aws_subnet" "sbn_prd_lb_2" {
    availability_zone = var.sbn_prd_lb_2[0]
    cidr_block = var.sbn_prd_lb_2[1]
    vpc_id = aws_vpc.vpc_prd.id
    tags = merge({"Name" =  var.sbn_prd_lb_2[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_prd
    ]
}


resource "aws_subnet" "sbn_prd_inn_1" {
    availability_zone = var.sbn_prd_inn_1[0]
    cidr_block = var.sbn_prd_inn_1[1]
    vpc_id = aws_vpc.vpc_prd.id
    tags = merge({"Name" =  var.sbn_prd_inn_1[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_prd
    ]
}


resource "aws_subnet" "sbn_prd_inn_2" {
    availability_zone = var.sbn_prd_inn_2[0]
    cidr_block = var.sbn_prd_inn_2[1]
    vpc_id = aws_vpc.vpc_prd.id
    tags = merge({"Name" =  var.sbn_prd_inn_2[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_prd
    ]
}


########## conprd

resource "aws_subnet" "sbn_conprd_ext_1" {
    availability_zone = var.sbn_conprd_ext_1[0]
    cidr_block = var.sbn_conprd_ext_1[1]
    vpc_id = aws_vpc.vpc_conprd.id
    tags = merge({"Name" =  var.sbn_conprd_ext_1[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_conprd
    ]
}


resource "aws_subnet" "sbn_conprd_ext_2" {
    availability_zone = var.sbn_conprd_ext_2[0]
    cidr_block = var.sbn_conprd_ext_2[1]
    vpc_id = aws_vpc.vpc_conprd.id
    tags = merge({"Name" =  var.sbn_conprd_ext_2[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_conprd
    ]
}


resource "aws_subnet" "sbn_conprd_inn_1" {
    availability_zone = var.sbn_conprd_inn_1[0]
    cidr_block = var.sbn_conprd_inn_1[1]
    vpc_id = aws_vpc.vpc_conprd.id
    tags = merge({"Name" =  var.sbn_conprd_inn_1[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_conprd
    ]
}


resource "aws_subnet" "sbn_conprd_inn_2" {
    availability_zone = var.sbn_conprd_inn_2[0]
    cidr_block = var.sbn_conprd_inn_2[1]
    vpc_id = aws_vpc.vpc_conprd.id
    tags = merge({"Name" =  var.sbn_conprd_inn_2[2]}, var.tags)

    depends_on = [
        aws_vpc.vpc_conprd
    ]
}


resource "aws_internet_gateway" "igw_prd" {
    vpc_id = aws_vpc.vpc_prd.id
    tags = merge({"Name" =  var.igw_prd}, var.tags)
}

/*

resource "aws_internet_gateway" "igw_dev" {
    vpc_id = aws_vpc.vpc_dev.id
    tags = merge({"Name" =  var.igw_dev}, var.tags)
}*/