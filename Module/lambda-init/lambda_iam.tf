variable lambda_role {
    type = string
}

variable cmk_log_s3 {
    type = string
}

variable lambda_inline_policy { 
    type = string
}

resource "aws_iam_role" "lambda_role" {
    name = var.lambda_role
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
            "Service": "lambda.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}


resource "aws_iam_role_policy" "lambda_policy" {
  name = var.lambda_inline_policy
  role = aws_iam_role.lambda_role.id

  depends_on = [
      aws_iam_role.lambda_role
  ]

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowAssumeRole",
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents",
                "logs:DescribeLogStreams",
                "logs:CreateLogDelivery",
                "logs:DeleteLogDelivery"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "kms:Decrypt",
                "kms:Encrypt",
                "kms:GenerateDataKey",
                "kms:DescribeKey",
                "kms:ReEncrypt*"
            ],
            "Resource": [
                "${var.cmk_log_s3}"
            ]
        }
    ]
}
EOF
}