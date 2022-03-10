
// RT_PRD
variable rt_prd_ext {
    type = object ({
        name = string
        propagating_vgws = list(string)
        routes = list(tuple([string, string]))
    })
}

variable rt_prd_pri1 {
    type = object ({
        name = string
        propagating_vgws = list(string)
        routes = list(tuple([string, string]))
    })
}

variable rt_prd_pri2 {
    type = object ({
        name = string
        propagating_vgws = list(string)
        routes = list(tuple([string, string]))
    })
}


//RT_CON_PRD
variable rt_conprd_ext {
    type = object ({
        name = string
        propagating_vgws = list(string)
        routes = list(tuple([string, string]))
    })
}
variable rt_conprd_inn {
    type = object ({
        name = string
        propagating_vgws = list(string)
        routes = list(tuple([string, string]))
    })
}
/*
resource "aws_route_table" "rt_condev_ext" {
    vpc_id = aws_vpc.vpc_condev.id
    propagating_vgws = var.rt_condev_ext.propagating_vgws

    dynamic route {
        for_each = toset(var.rt_condev_ext.routes)
        content {
            cidr_block = length(regexall(".", route.value[0])) == 0 ? "" : route.value[0]
            ipv6_cidr_block = length(regexall(":", route.value[0])) == 0 ? "" : route.value[0]
            

            transit_gateway_id = (
                route.value[1] == "tgw_condev" ? aws_ec2_transit_gateway.tgw_condev.id : ""
            )
        }
    }

    tags = merge({"Name" =  var.rt_condev_ext.name}, var.tags)

      depends_on = [
        aws_vpc.vpc_condev,
        aws_ec2_transit_gateway.tgw_condev
    ]
}


resource "aws_route_table" "rt_condev_inn" {
    vpc_id = aws_vpc.vpc_condev.id
    propagating_vgws = var.rt_condev_inn.propagating_vgws

    dynamic route {
        for_each = toset(var.rt_condev_inn.routes)
        content {
            cidr_block = length(regexall(".", route.value[0])) == 0 ? "" : route.value[0]
            ipv6_cidr_block = length(regexall(":", route.value[0])) == 0 ? "" : route.value[0]
            
            transit_gateway_id = (
                route.value[1] == "tgw_condev" ? aws_ec2_transit_gateway.tgw_condev.id : ""
            )
           
        }
    }

    tags = merge({"Name" =  var.rt_condev_inn.name}, var.tags)
   
   
     depends_on = [
        aws_vpc.vpc_condev,
        aws_ec2_transit_gateway.tgw_condev
    ]
}





resource "aws_route_table" "rt_conprd_ext" {
    vpc_id = aws_vpc.vpc_conprd.id
    propagating_vgws = var.rt_conprd_ext.propagating_vgws

    dynamic route {
        for_each = toset(var.rt_conprd_ext.routes)
        content {
            cidr_block = length(regexall(".", route.value[0])) == 0 ? "" : route.value[0]
            ipv6_cidr_block = length(regexall(":", route.value[0])) == 0 ? "" : route.value[0]
            
             transit_gateway_id = (
                route.value[1] == "tgw_conprd" ? aws_ec2_transit_gateway.tgw_conprd.id : ""
            )
             #transit_gateway_id = lookup(route.value[1], "tgw_conprd", null)
                
        }
    }

    tags = merge({"Name" =  var.rt_conprd_ext.name}, var.tags)
   
   
     depends_on = [
        aws_vpc.vpc_conprd,
        aws_ec2_transit_gateway.tgw_conprd
    ]
}

//////////////////........???????????????????????????????/...............////////////////////////
resource "aws_route_table" "rt_conprd_inn" {
    vpc_id = aws_vpc.vpc_conprd.id
    propagating_vgws = var.rt_conprd_inn.propagating_vgws

    dynamic route {
        for_each = toset(var.rt_conprd_inn.routes)
        content {
            cidr_block = length(regexall(".", route.value[0])) == 0 ? "" : route.value[0]
            ipv6_cidr_block = length(regexall(":", route.value[0])) == 0 ? "" : route.value[0]
            
        }
    }

    tags = merge({"Name" =  var.rt_conprd_inn.name}, var.tags)
   
   
     depends_on = [
        aws_vpc.vpc_conprd,
        aws_ec2_transit_gateway.tgw_conprd
    ]
   
}
//////////////////........???????????????????????????????/...............////////////////////////

 */


/*
//rt_dev
resource "aws_route_table" "rt_dev_ext" {
    vpc_id = aws_vpc.vpc_dev.id
    propagating_vgws = var.rt_dev_ext.propagating_vgws

    dynamic route {
        for_each = toset(var.rt_dev_ext.routes)
        content {
            cidr_block = length(regexall(".", route.value[0])) == 0 ? "" : route.value[0]
            ipv6_cidr_block = length(regexall(":", route.value[0])) == 0 ? "" : route.value[0]
            
            # transit_gateway_id = (
             #   route.value[1] == "tgw_dev" ? aws_ec2_transit_gateway.tgw_dev.id : ""
              #  )
                
             gateway_id = (
                route.value[1] == "igw_dev" ? aws_internet_gateway.igw_dev.id : "" 
                )
            
           
        }
    }

    tags = merge({"Name" =  var.rt_dev_ext.name}, var.tags)
   
   
     depends_on = [
        aws_vpc.vpc_prd,
        aws_ec2_transit_gateway.tgw_dev,
        aws_internet_gateway.igw_dev
    ]
}


resource "aws_route_table" "rt_dev_pri1" {
    vpc_id = aws_vpc.vpc_dev.id
    propagating_vgws = var.rt_dev_pri1.propagating_vgws

    dynamic route {
        for_each = toset(var.rt_dev_pri1.routes)
        content {
            cidr_block = length(regexall(".", route.value[0])) == 0 ? "" : route.value[0]
            ipv6_cidr_block = length(regexall(":", route.value[0])) == 0 ? "" : route.value[0]
        
             transit_gateway_id = (
                route.value[1] == "tgw_condev" ? aws_ec2_transit_gateway.tgw_condev.id
                            : (route.value[1] == "tgw_dev" ? aws_ec2_transit_gateway.tgw_dev.id : "" ))
           
        }
    }

    tags = merge({"Name" =  var.rt_dev_pri1.name}, var.tags)
   
   
     depends_on = [
        aws_vpc.vpc_dev,
        aws_ec2_transit_gateway.tgw_condev,
        aws_ec2_transit_gateway.tgw_dev
    ]
}

resource "aws_route_table" "rt_dev_pri2" {
    vpc_id = aws_vpc.vpc_dev.id
    propagating_vgws = var.rt_dev_pri2.propagating_vgws

    dynamic route {
        for_each = toset(var.rt_dev_pri2.routes)
        content {
            cidr_block = length(regexall(".", route.value[0])) == 0 ? "" : route.value[0]
            ipv6_cidr_block = length(regexall(":", route.value[0])) == 0 ? "" : route.value[0]
            
            transit_gateway_id = (
                route.value[1] == "tgw_condev" ? aws_ec2_transit_gateway.tgw_condev.id
                            : (route.value[1] == "tgw_dev" ? aws_ec2_transit_gateway.tgw_dev.id : "" ))
           
        }
    }

    tags = merge({"Name" =  var.rt_dev_pri2.name}, var.tags)
   
   
     depends_on = [
        aws_vpc.vpc_dev,
        aws_ec2_transit_gateway.tgw_condev,
        aws_ec2_transit_gateway.tgw_dev
    ]
}


*/



//rt_prd
resource "aws_route_table" "rt_prd_ext" {
    vpc_id = aws_vpc.vpc_prd.id
    propagating_vgws = var.rt_prd_ext.propagating_vgws

    dynamic route {
        for_each = toset(var.rt_prd_ext.routes)
        content {
            cidr_block = length(regexall(".", route.value[0])) == 0 ? "" : route.value[0]
            ipv6_cidr_block = length(regexall(":", route.value[0])) == 0 ? "" : route.value[0]
           
             transit_gateway_id = (
                route.value[1] == "tgw_prd" ? aws_ec2_transit_gateway.tgw_prd.id : ""
                )
                
             gateway_id = (
                route.value[1] == "igw_prd" ? aws_internet_gateway.igw_prd.id : "" 
                )
        }
    }

    tags = merge({"Name" =  var.rt_prd_ext.name}, var.tags)
   
   
     depends_on = [
        aws_vpc.vpc_prd,
        aws_ec2_transit_gateway.tgw_prd,
        aws_internet_gateway.igw_prd
    ]
}









resource "aws_route_table" "rt_prd_pri1" {
    vpc_id = aws_vpc.vpc_prd.id
    propagating_vgws = var.rt_prd_pri1.propagating_vgws

    dynamic route {
        for_each = toset(var.rt_prd_pri1.routes)
        content {
            cidr_block = length(regexall(".", route.value[0])) == 0 ? "" : route.value[0]
            ipv6_cidr_block = length(regexall(":", route.value[0])) == 0 ? "" : route.value[0]
            
            transit_gateway_id = (
                route.value[1] == "tgw_conprd" ? aws_ec2_transit_gateway.tgw_conprd.id
                            : (route.value[1] == "tgw_prd" ? aws_ec2_transit_gateway.tgw_prd.id : "" ))
           
        }
    }

    tags = merge({"Name" =  var.rt_prd_pri1.name}, var.tags)
   
   
     depends_on = [
        aws_vpc.vpc_prd,
        aws_ec2_transit_gateway.tgw_conprd,
        aws_ec2_transit_gateway.tgw_prd
    ]
}



resource "aws_route_table" "rt_prd_pri2" {
    vpc_id = aws_vpc.vpc_prd.id
    propagating_vgws = var.rt_prd_pri2.propagating_vgws

    dynamic route {
        for_each = toset(var.rt_prd_pri2.routes)
        content {
            cidr_block = length(regexall(".", route.value[0])) == 0 ? "" : route.value[0]
            ipv6_cidr_block = length(regexall(":", route.value[0])) == 0 ? "" : route.value[0]
            
            transit_gateway_id = (
                route.value[1] == "tgw_conprd" ? aws_ec2_transit_gateway.tgw_conprd.id
                            : (route.value[1] == "tgw_prd" ? aws_ec2_transit_gateway.tgw_prd.id : "" ))
           
        }
    }

    tags = merge({"Name" =  var.rt_prd_pri2.name}, var.tags)
   
   
     depends_on = [
        aws_vpc.vpc_prd,
        aws_ec2_transit_gateway.tgw_conprd,
        aws_ec2_transit_gateway.tgw_prd
    ]
}




resource "aws_route_table" "rt_conprd_ext" {
    vpc_id = aws_vpc.vpc_conprd.id
    propagating_vgws = var.rt_conprd_ext.propagating_vgws

    dynamic route {
        for_each = toset(var.rt_conprd_ext.routes)
        content {
            cidr_block = length(regexall(".", route.value[0])) == 0 ? "" : route.value[0]
            ipv6_cidr_block = length(regexall(":", route.value[0])) == 0 ? "" : route.value[0]
            
             transit_gateway_id = (
                route.value[1] == "tgw_conprd" ? aws_ec2_transit_gateway.tgw_conprd.id : ""
            )
             #transit_gateway_id = lookup(route.value[1], "tgw_conprd", null)
                
        }
    }

    tags = merge({"Name" =  var.rt_conprd_ext.name}, var.tags)
   
   
     depends_on = [
        aws_vpc.vpc_conprd,
        aws_ec2_transit_gateway.tgw_conprd
    ]
}

//////////////////........???????????????????????????????/...............////////////////////////
resource "aws_route_table" "rt_conprd_inn" {
    vpc_id = aws_vpc.vpc_conprd.id
    propagating_vgws = var.rt_conprd_inn.propagating_vgws

    dynamic route {
        for_each = toset(var.rt_conprd_inn.routes)
        content {
            cidr_block = length(regexall(".", route.value[0])) == 0 ? "" : route.value[0]
            ipv6_cidr_block = length(regexall(":", route.value[0])) == 0 ? "" : route.value[0]
            
        }
    }

    tags = merge({"Name" =  var.rt_conprd_inn.name}, var.tags)
   
   /*
     depends_on = [
        aws_vpc.vpc_conprd,
        aws_ec2_transit_gateway.tgw_conprd
    ]*/
}
//////////////////........???????????????????????????????/...............////////////////////////


/*

resource "aws_route_table_association" "sbn_dev_ext_1" {
  route_table_id = aws_route_table.rt_dev_ext.id
  subnet_id      = aws_subnet.sbn_dev_ext_1.id
}

resource "aws_route_table_association" "sbn_dev_ext_2" {
  route_table_id = aws_route_table.rt_dev_ext.id
  subnet_id      = aws_subnet.sbn_dev_ext_2.id
}

resource "aws_route_table_association" "sbn_dev_utm_1" {
  route_table_id = aws_route_table.rt_dev_pri1.id
  subnet_id      = aws_subnet.sbn_dev_utm_1.id
}

resource "aws_route_table_association" "sbn_dev_lb_1" {
  route_table_id = aws_route_table.rt_dev_pri1.id
  subnet_id      = aws_subnet.sbn_dev_lb_1.id
}






resource "aws_route_table_association" "sbn_dev_inn_1" {
  route_table_id = aws_route_table.rt_dev_pri1.id
  subnet_id      = aws_subnet.sbn_dev_inn_1.id
}

resource "aws_route_table_association" "sbn_dev_utm_2" {
  route_table_id = aws_route_table.rt_dev_pri2.id
  subnet_id      = aws_subnet.sbn_dev_utm_2.id
}

resource "aws_route_table_association" "sbn_dev_lb_2" {
  route_table_id = aws_route_table.rt_dev_pri2.id
  subnet_id      = aws_subnet.sbn_dev_lb_2.id
}

resource "aws_route_table_association" "sbn_dev_inn_2" {
  route_table_id = aws_route_table.rt_dev_pri2.id
  subnet_id      = aws_subnet.sbn_dev_inn_2.id
}

*/
#prd
resource "aws_route_table_association" "sbn_prd_ext_1" {
  route_table_id = aws_route_table.rt_prd_ext.id
  subnet_id      = aws_subnet.sbn_prd_ext_1.id
}


resource "aws_route_table_association" "sbn_prd_ext_2" {
  route_table_id = aws_route_table.rt_prd_ext.id
  subnet_id      = aws_subnet.sbn_prd_ext_2.id
}


resource "aws_route_table_association" "sbn_prd_utm_1" {
  route_table_id = aws_route_table.rt_prd_pri1.id
  subnet_id      = aws_subnet.sbn_prd_utm_1.id
}


resource "aws_route_table_association" "sbn_prd_lb_1" {
  route_table_id = aws_route_table.rt_prd_pri1.id
  subnet_id      = aws_subnet.sbn_prd_lb_1.id
}

resource "aws_route_table_association" "sbn_prd_inn_1" {
  route_table_id = aws_route_table.rt_prd_pri1.id
  subnet_id      = aws_subnet.sbn_prd_inn_1.id
}

resource "aws_route_table_association" "sbn_prd_utm_2" {
  route_table_id = aws_route_table.rt_prd_pri2.id
  subnet_id      = aws_subnet.sbn_prd_utm_2.id
}

resource "aws_route_table_association" "sbn_prd_lb_2" {
  route_table_id = aws_route_table.rt_prd_pri2.id
  subnet_id      = aws_subnet.sbn_prd_lb_2.id
}

resource "aws_route_table_association" "sbn_prd_inn_2" {
  route_table_id = aws_route_table.rt_prd_pri2.id
  subnet_id      = aws_subnet.sbn_prd_inn_2.id
}

resource "aws_route_table_association" "sbn_conprd_ext_1" {
  route_table_id = aws_route_table.rt_conprd_ext.id
  subnet_id      = aws_subnet.sbn_conprd_ext_1.id
}

resource "aws_route_table_association" "sbn_conprd_ext_2" {
  route_table_id = aws_route_table.rt_conprd_ext.id
  subnet_id      = aws_subnet.sbn_conprd_ext_2.id
}

resource "aws_route_table_association" "sbn_conprd_inn_1" {
  route_table_id = aws_route_table.rt_conprd_inn.id
  subnet_id      = aws_subnet.sbn_conprd_inn_1.id
}

resource "aws_route_table_association" "sbn_conprd_inn_2" {
  route_table_id = aws_route_table.rt_conprd_inn.id
  subnet_id      = aws_subnet.sbn_conprd_inn_2.id
}
