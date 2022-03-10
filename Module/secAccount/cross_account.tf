variable cross_account_ADM {
    type = object({
        name = string
        policy = list(string)
    })
}

variable cross_account_OPS {
    type = object({
        name = string
        policy = list(string)
    })
}

variable IAM_Account_id {
    type = string
}

resource "aws_iam_role" "cross_account_ADM" {
    name = var.cross_account_ADM.name
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${var.IAM_Account_id}:root"
            },
            "Action": "sts:AssumeRole",
            "Condition": {}
        }
    ]
}
EOF
}

resource "aws_iam_role" "cross_account_OPS" {
    name = var.cross_account_OPS.name
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${var.IAM_Account_id}:root"
            },
            "Action": "sts:AssumeRole",
            "Condition": {}
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "cross_account_ADM" {
    for_each = toset(var.cross_account_ADM.policy)
    role = aws_iam_role.cross_account_ADM.name
    policy_arn = each.key

    depends_on = [
        aws_iam_role.cross_account_ADM
    ]
}

resource "aws_iam_role_policy_attachment" "cross_account_OPS" {
    for_each = toset(var.cross_account_OPS.policy)
    role = aws_iam_role.cross_account_OPS.name
    policy_arn = each.key

    depends_on = [
        aws_iam_role.cross_account_OPS
    ]
}