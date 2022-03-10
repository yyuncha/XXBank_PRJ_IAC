/*
variable resolver_rules_ids {
    type = list
}

resource "aws_route53_resolver_rule_association" "rule_association" {
    count = length(var.resolver_rules_ids)
    resolver_rule_id = aws_route53_resolver_rule.resolver_rules[count.index]
    vpc_id = aws_vpc.vpc.id

    depends_on = [
        aws_vpc.vpc
    ]
}
*/