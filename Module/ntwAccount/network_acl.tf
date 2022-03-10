

/*
variable nacl_dev_ext {
    type = object ({
        #[rule_no, protocol, from_port, to_port, cidr_block, action]
        ingresses = list(tuple([number, string, number, number, string, string]))
        egresses = list(tuple([number, string, number, number, string, string]))
        name = string
    })
}

variable nacl_dev_inn {
    type = object ({
        #[rule_no, protocol, from_port, to_port, cidr_block, action]
        ingresses = list(tuple([number, string, number, number, string, string]))
        egresses = list(tuple([number, string, number, number, string, string]))
        name = string
    })
}

variable nacl_dev_utm {
    type = object ({
        #[rule_no, protocol, from_port, to_port, cidr_block, action]
        ingresses = list(tuple([number, string, number, number, string, string]))
        egresses = list(tuple([number, string, number, number, string, string]))
        name = string
    })
}

variable nacl_dev_lb {
    type = object ({
        #[rule_no, protocol, from_port, to_port, cidr_block, action]
        ingresses = list(tuple([number, string, number, number, string, string]))
        egresses = list(tuple([number, string, number, number, string, string]))
        name = string
    })
}

*/

variable nacl_prd_ext {
    type = object ({
        #[rule_no, protocol, from_port, to_port, cidr_block, action]
        ingresses = list(tuple([number, string, number, number, string, string]))
        egresses = list(tuple([number, string, number, number, string, string]))
        name = string
    })
}

variable nacl_prd_inn {
    type = object ({
        #[rule_no, protocol, from_port, to_port, cidr_block, action]
        ingresses = list(tuple([number, string, number, number, string, string]))
        egresses = list(tuple([number, string, number, number, string, string]))
        name = string
    })
}

variable nacl_prd_lb {
    type = object ({
        #[rule_no, protocol, from_port, to_port, cidr_block, action]
        ingresses = list(tuple([number, string, number, number, string, string]))
        egresses = list(tuple([number, string, number, number, string, string]))
        name = string
    })
}

variable nacl_prd_utm {
    type = object ({
        #[rule_no, protocol, from_port, to_port, cidr_block, action]
        ingresses = list(tuple([number, string, number, number, string, string]))
        egresses = list(tuple([number, string, number, number, string, string]))
        name = string
    })
}

variable nacl_conprd {
    type = object ({
        #[rule_no, protocol, from_port, to_port, cidr_block, action]
        ingresses = list(tuple([number, string, number, number, string, string]))
        egresses = list(tuple([number, string, number, number, string, string]))
        name = string
    })
}

/*
resource "aws_network_acl" "nacl_condev" {
    vpc_id = aws_vpc.vpc_condev.id
    subnet_ids = [
        aws_subnet.sbn_condev_ext_1.id,
        aws_subnet.sbn_condev_ext_2.id,
        aws_subnet.sbn_condev_inn_1.id,
        aws_subnet.sbn_condev_inn_2.id
    ]
    dynamic ingress {
        for_each = toset(var.nacl_condev.ingresses)
        content {
            rule_no = ingress.value[0]
            protocol = ingress.value[1]
            from_port = ingress.value[2]
            to_port = ingress.value[3]
            cidr_block = ingress.value[4]
            action = ingress.value[5]
        }
    }
    dynamic egress {
        for_each = toset(var.nacl_condev.egresses)
        content {
            rule_no = egress.value[0]
            protocol = egress.value[1]
            from_port = egress.value[2]
            to_port = egress.value[3]
            cidr_block = egress.value[4]
            action = egress.value[5]
            icmp_type = egress.value[1] == "1" ? -1 : 0
            icmp_code = egress.value[1] == "1" ? -1 : 0
        }
    }

    tags = merge({"Name" =  var.nacl_condev.name}, var.tags)
    /*
    depends_on = [
        aws_vpc.vpc_condev,
        aws_subnet.sbn_condev_ext_1,
        aws_subnet.sbn_condev_ext_2,
        aws_subnet.sbn_condev_inn_1,
        aws_subnet.sbn_condev_inn_2
    ]
}

resource "aws_network_acl" "nacl_conprd" {
    vpc_id = aws_vpc.vpc_conprd.id
    subnet_ids = [
        aws_subnet.sbn_conprd_ext_1.id,
        aws_subnet.sbn_conprd_ext_2.id,
        aws_subnet.sbn_conprd_inn_1.id,
        aws_subnet.sbn_conprd_inn_2.id
    ]
    dynamic ingress {
        for_each = toset(var.nacl_conprd.ingresses)
        content {
            rule_no = ingress.value[0]
            protocol = ingress.value[1]
            from_port = ingress.value[2]
            to_port = ingress.value[3]
            cidr_block = ingress.value[4]
            action = ingress.value[5]
        }
    }
    dynamic egress {
        for_each = toset(var.nacl_conprd.egresses)
        content {
            rule_no = egress.value[0]
            protocol = egress.value[1]
            from_port = egress.value[2]
            to_port = egress.value[3]
            cidr_block = egress.value[4]
            action = egress.value[5]
            icmp_type = egress.value[1] == "1" ? -1 : 0
            icmp_code = egress.value[1] == "1" ? -1 : 0
        }
    }

    tags = merge({"Name" =  var.nacl_conprd.name}, var.tags)
    /*
    depends_on = [
        aws_vpc.vpc_conprd,
        aws_subnet.sbn_conprd_ext_1.id,
        aws_subnet.sbn_conprd_ext_2.id,
        aws_subnet.sbn_conprd_inn_1.id,
        aws_subnet.sbn_conprd_inn_2.id
    ]
}

resource "aws_network_acl" "nacl_dev" {
    vpc_id = aws_vpc.vpc_dev.id
    subnet_ids = [
        aws_subnet.sbn_dev_ext_1.id,
        aws_subnet.sbn_dev_ext_2.id,
        aws_subnet.sbn_dev_utm_1.id,
        aws_subnet.sbn_dev_utm_2.id,
        aws_subnet.sbn_dev_lb_1.id,
        aws_subnet.sbn_dev_lb_2.id,
        aws_subnet.sbn_dev_inn_1.id,
        aws_subnet.sbn_dev_inn_2.id
    ]
    dynamic ingress {
        for_each = toset(var.nacl_dev.ingresses)
        content {
            rule_no = ingress.value[0]
            protocol = ingress.value[1]
            from_port = ingress.value[2]
            to_port = ingress.value[3]
            cidr_block = ingress.value[4]
            action = ingress.value[5]
        }
    }
    dynamic egress {
        for_each = toset(var.nacl_dev.egresses)
        content {
            rule_no = egress.value[0]
            protocol = egress.value[1]
            from_port = egress.value[2]
            to_port = egress.value[3]
            cidr_block = egress.value[4]
            action = egress.value[5]
            icmp_type = egress.value[1] == "1" ? -1 : 0
            icmp_code = egress.value[1] == "1" ? -1 : 0
        }
    }

    tags = merge({"Name" =  var.nacl_dev.name}, var.tags)
    /*
    depends_on = [
        aws_vpc.vpc_dev,
        aws_subnet.sbn_dev_ext_1.id,
        aws_subnet.sbn_dev_ext_2.id,
        aws_subnet.sbn_dev_utm_1.id,
        aws_subnet.sbn_dev_utm_2.id,
        aws_subnet.sbn_dev_lb_1.id,
        aws_subnet.sbn_dev_lb_2.id,
        aws_subnet.sbn_dev_inn_1.id,
        aws_subnet.sbn_dev_inn_2.id
    ]
}*/





/*
resource "aws_network_acl" "nacl_dev_ext" {
    vpc_id = aws_vpc.vpc_dev.id
    subnet_ids = [
        aws_subnet.sbn_dev_ext_1.id,
        aws_subnet.sbn_dev_ext_2.id
    ]
    dynamic ingress {
        for_each = toset(var.nacl_dev_ext.ingresses)
        content {
            rule_no = ingress.value[0]
            protocol = ingress.value[1]
            from_port = ingress.value[2]
            to_port = ingress.value[3]
            cidr_block = ingress.value[4]
            action = ingress.value[5]
        }
    }
    dynamic egress {
        for_each = toset(var.nacl_dev_ext.egresses)
        content {
            rule_no = egress.value[0]
            protocol = egress.value[1]
            from_port = egress.value[2]
            to_port = egress.value[3]
            cidr_block = egress.value[4]
            action = egress.value[5]
            icmp_type = egress.value[1] == "1" ? -1 : 0
            icmp_code = egress.value[1] == "1" ? -1 : 0
        }
    }

    tags = merge({"Name" =  var.nacl_dev_ext.name}, var.tags)


resource "aws_network_acl" "nacl_dev_inn" {
    vpc_id = aws_vpc.vpc_dev.id
    subnet_ids = [
        aws_subnet.sbn_dev_inn_1.id,
        aws_subnet.sbn_dev_inn_2.id
    ]
    dynamic ingress {
        for_each = toset(var.nacl_dev_inn.ingresses)
        content {
            rule_no = ingress.value[0]
            protocol = ingress.value[1]
            from_port = ingress.value[2]
            to_port = ingress.value[3]
            cidr_block = ingress.value[4]
            action = ingress.value[5]
        }
    }
    dynamic egress {
        for_each = toset(var.nacl_dev_inn.egresses)
        content {
            rule_no = egress.value[0]
            protocol = egress.value[1]
            from_port = egress.value[2]
            to_port = egress.value[3]
            cidr_block = egress.value[4]
            action = egress.value[5]
            icmp_type = egress.value[1] == "1" ? -1 : 0
            icmp_code = egress.value[1] == "1" ? -1 : 0
        }
    }

    tags = merge({"Name" =  var.nacl_dev_inn.name}, var.tags)
    
    depends_on = [
        aws_vpc.vpc_prd,
        aws_subnet.sbn_prd_inn_1.id,
        aws_subnet.sbn_prd_inn_2.id
    ]
}

resource "aws_network_acl" "nacl_dev_lb" {
    vpc_id = aws_vpc.vpc_dev.id
    subnet_ids = [
        aws_subnet.sbn_dev_lb_1.id,
        aws_subnet.sbn_dev_lb_2.id
    ]
    dynamic ingress {
        for_each = toset(var.nacl_dev_lb.ingresses)
        content {
            rule_no = ingress.value[0]
            protocol = ingress.value[1]
            from_port = ingress.value[2]
            to_port = ingress.value[3]
            cidr_block = ingress.value[4]
            action = ingress.value[5]
        }
    }
    dynamic egress {
        for_each = toset(var.nacl_dev_lb.egresses)
        content {
            rule_no = egress.value[0]
            protocol = egress.value[1]
            from_port = egress.value[2]
            to_port = egress.value[3]
            cidr_block = egress.value[4]
            action = egress.value[5]
            icmp_type = egress.value[1] == "1" ? -1 : 0
            icmp_code = egress.value[1] == "1" ? -1 : 0
        }
    }

    tags = merge({"Name" =  var.nacl_dev_lb.name}, var.tags)
   
    depends_on = [
        aws_vpc.vpc_prd,
        aws_subnet.sbn_prd_lb_1.id,
        aws_subnet.sbn_prd_lb_2.id
    ]
}

resource "aws_network_acl" "nacl_dev_utm" {
    vpc_id = aws_vpc.vpc_dev.id
    subnet_ids = [
        aws_subnet.sbn_dev_utm_1.id,
        aws_subnet.sbn_dev_utm_2.id
    ]
    dynamic ingress {
        for_each = toset(var.nacl_dev_utm.ingresses)
        content {
            rule_no = ingress.value[0]
            protocol = ingress.value[1]
            from_port = ingress.value[2]
            to_port = ingress.value[3]
            cidr_block = ingress.value[4]
            action = ingress.value[5]
        }
    }
    dynamic egress {
        for_each = toset(var.nacl_dev_utm.egresses)
        content {
            rule_no = egress.value[0]
            protocol = egress.value[1]
            from_port = egress.value[2]
            to_port = egress.value[3]
            cidr_block = egress.value[4]
            action = egress.value[5]
            icmp_type = egress.value[1] == "1" ? -1 : 0
            icmp_code = egress.value[1] == "1" ? -1 : 0
        }
    }

    tags = merge({"Name" =  var.nacl_dev_utm.name}, var.tags)
 
    depends_on = [
        aws_vpc.vpc_prd,
        aws_subnet.sbn_prd_utm_1.id,
        aws_subnet.sbn_prd_utm_2.id
    ]
}

*/









resource "aws_network_acl" "nacl_prd_ext" {
    vpc_id = aws_vpc.vpc_prd.id
    subnet_ids = [
        aws_subnet.sbn_prd_ext_1.id,
        aws_subnet.sbn_prd_ext_2.id
    ]
    dynamic ingress {
        for_each = toset(var.nacl_prd_ext.ingresses)
        content {
            rule_no = ingress.value[0]
            protocol = ingress.value[1]
            from_port = ingress.value[2]
            to_port = ingress.value[3]
            cidr_block = ingress.value[4]
            action = ingress.value[5]
        }
    }
    dynamic egress {
        for_each = toset(var.nacl_prd_ext.egresses)
        content {
            rule_no = egress.value[0]
            protocol = egress.value[1]
            from_port = egress.value[2]
            to_port = egress.value[3]
            cidr_block = egress.value[4]
            action = egress.value[5]
            icmp_type = egress.value[1] == "1" ? -1 : 0
            icmp_code = egress.value[1] == "1" ? -1 : 0
        }
    }

    tags = merge({"Name" =  var.nacl_prd_ext.name}, var.tags)
    /*
    depends_on = [
        aws_vpc.vpc_prd,
        aws_subnet.sbn_prd_ext_1.id,
        aws_subnet.sbn_prd_ext_2.id
    ]*/
}

resource "aws_network_acl" "nacl_prd_inn" {
    vpc_id = aws_vpc.vpc_prd.id
    subnet_ids = [
        aws_subnet.sbn_prd_inn_1.id,
        aws_subnet.sbn_prd_inn_2.id
    ]
    dynamic ingress {
        for_each = toset(var.nacl_prd_inn.ingresses)
        content {
            rule_no = ingress.value[0]
            protocol = ingress.value[1]
            from_port = ingress.value[2]
            to_port = ingress.value[3]
            cidr_block = ingress.value[4]
            action = ingress.value[5]
        }
    }
    dynamic egress {
        for_each = toset(var.nacl_prd_inn.egresses)
        content {
            rule_no = egress.value[0]
            protocol = egress.value[1]
            from_port = egress.value[2]
            to_port = egress.value[3]
            cidr_block = egress.value[4]
            action = egress.value[5]
            icmp_type = egress.value[1] == "1" ? -1 : 0
            icmp_code = egress.value[1] == "1" ? -1 : 0
        }
    }

    tags = merge({"Name" =  var.nacl_prd_inn.name}, var.tags)
    /*
    depends_on = [
        aws_vpc.vpc_prd,
        aws_subnet.sbn_prd_inn_1.id,
        aws_subnet.sbn_prd_inn_2.id
    ]*/
}

resource "aws_network_acl" "nacl_prd_lb" {
    vpc_id = aws_vpc.vpc_prd.id
    subnet_ids = [
        aws_subnet.sbn_prd_lb_1.id,
        aws_subnet.sbn_prd_lb_2.id
    ]
    dynamic ingress {
        for_each = toset(var.nacl_prd_lb.ingresses)
        content {
            rule_no = ingress.value[0]
            protocol = ingress.value[1]
            from_port = ingress.value[2]
            to_port = ingress.value[3]
            cidr_block = ingress.value[4]
            action = ingress.value[5]
        }
    }
    dynamic egress {
        for_each = toset(var.nacl_prd_lb.egresses)
        content {
            rule_no = egress.value[0]
            protocol = egress.value[1]
            from_port = egress.value[2]
            to_port = egress.value[3]
            cidr_block = egress.value[4]
            action = egress.value[5]
            icmp_type = egress.value[1] == "1" ? -1 : 0
            icmp_code = egress.value[1] == "1" ? -1 : 0
        }
    }

    tags = merge({"Name" =  var.nacl_prd_lb.name}, var.tags)
    /*
    depends_on = [
        aws_vpc.vpc_prd,
        aws_subnet.sbn_prd_lb_1.id,
        aws_subnet.sbn_prd_lb_2.id
    ]*/
}

resource "aws_network_acl" "nacl_prd_utm" {
    vpc_id = aws_vpc.vpc_prd.id
    subnet_ids = [
        aws_subnet.sbn_prd_utm_1.id,
        aws_subnet.sbn_prd_utm_2.id
    ]
    dynamic ingress {
        for_each = toset(var.nacl_prd_utm.ingresses)
        content {
            rule_no = ingress.value[0]
            protocol = ingress.value[1]
            from_port = ingress.value[2]
            to_port = ingress.value[3]
            cidr_block = ingress.value[4]
            action = ingress.value[5]
        }
    }
    dynamic egress {
        for_each = toset(var.nacl_prd_utm.egresses)
        content {
            rule_no = egress.value[0]
            protocol = egress.value[1]
            from_port = egress.value[2]
            to_port = egress.value[3]
            cidr_block = egress.value[4]
            action = egress.value[5]
            icmp_type = egress.value[1] == "1" ? -1 : 0
            icmp_code = egress.value[1] == "1" ? -1 : 0
        }
    }

    tags = merge({"Name" =  var.nacl_prd_utm.name}, var.tags)
    /*
    depends_on = [
        aws_vpc.vpc_prd,
        aws_subnet.sbn_prd_utm_1.id,
        aws_subnet.sbn_prd_utm_2.id
    ]*/
}


resource "aws_network_acl" "nacl_conprd" {
    vpc_id = aws_vpc.vpc_conprd.id
    subnet_ids = [
        aws_subnet.sbn_conprd_ext_1.id,
        aws_subnet.sbn_conprd_ext_2.id,
        aws_subnet.sbn_conprd_inn_1.id,
        aws_subnet.sbn_conprd_inn_2.id
    ]
    dynamic ingress {
        for_each = toset(var.nacl_conprd.ingresses)
        content {
            rule_no = ingress.value[0]
            protocol = ingress.value[1]
            from_port = ingress.value[2]
            to_port = ingress.value[3]
            cidr_block = ingress.value[4]
            action = ingress.value[5]
        }
    }
    dynamic egress {
        for_each = toset(var.nacl_conprd.egresses)
        content {
            rule_no = egress.value[0]
            protocol = egress.value[1]
            from_port = egress.value[2]
            to_port = egress.value[3]
            cidr_block = egress.value[4]
            action = egress.value[5]
            icmp_type = egress.value[1] == "1" ? -1 : 0
            icmp_code = egress.value[1] == "1" ? -1 : 0
        }
    }

    tags = merge({"Name" =  var.nacl_conprd.name}, var.tags)
    /*
    depends_on = [
        aws_vpc.vpc_conprd,
        aws_subnet.sbn_conprd_ext_1.id,
        aws_subnet.sbn_conprd_ext_2.id,
        aws_subnet.sbn_conprd_inn_1.id,
        aws_subnet.sbn_conprd_inn_2.id
    ]*/
}
