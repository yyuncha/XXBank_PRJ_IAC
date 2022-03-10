variable flowlog_bucket {
    type = string
}

variable cmk_log_s3 {
    type = string
}

variable LOG_Account_id {
    type = string
}

variable s3_accesslog_bucket {
    type = string
}

resource "aws_s3_bucket" "flowlog_bucket" {
    bucket = var.flowlog_bucket
    acl = "private"
    versioning { enabled = true }
    lifecycle_rule {
        id = "30Days"
        enabled = true

        expiration { days = 30 } # 1 months
    }
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                kms_master_key_id = var.cmk_log_s3
                sse_algorithm     = "aws:kms"
            }
        }
    }

    logging {
        target_bucket = var.s3_accesslog_bucket
        target_prefix = "${var.flowlog_bucket}/"
    }

    force_destroy = true
}

resource "aws_s3_bucket_policy" "flowlog_bucket_policy" {
  bucket = aws_s3_bucket.flowlog_bucket.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSLogDeliveryWrite",
            "Effect": "Allow",
            "Principal": {"Service": "delivery.logs.amazonaws.com"},
            "Action": "s3:PutObject",
            "Resource": [
            	"arn:aws:s3:::${var.flowlog_bucket}/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
                "arn:aws:s3:::${var.flowlog_bucket}/AWSLogs/${data.aws_caller_identity.current.account_id}/"
            ],
            "Condition": {"StringEquals": {"s3:x-amz-acl": "bucket-owner-full-control"}}
        },
        {
            "Sid": "AWSLogDeliveryAclCheck",
            "Effect": "Allow",
            "Principal": {"Service": "delivery.logs.amazonaws.com"},
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::${var.flowlog_bucket}"
        },
        {
            "Sid": "Require SSL",
            "Effect": "Deny",
            "Principal": {
              "AWS": "*"
            },
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::${var.flowlog_bucket}/*",
            "Condition": {
              "Bool": {
                "aws:SecureTransport": "false"
              }
            }
        },
        {
            "Sid": "ReadAccess",
            "Effect": "Allow",
            "Principal": {
                "AWS": [ "arn:aws:iam::${var.LOG_Account_id}:root" ]
            },
            "Action": "s3:GetObject",
            "Resource": [ "arn:aws:s3:::${var.flowlog_bucket}/*" ]
        },
        {
            "Sid": "ListAccess",
            "Effect": "Allow",
            "Principal": {
                "AWS": [ "arn:aws:iam::${var.LOG_Account_id}:root" ]
            },
            "Action": "s3:ListBucket",
            "Resource": [ "arn:aws:s3:::${var.flowlog_bucket}" ]
        }
    ]
}
EOF
}