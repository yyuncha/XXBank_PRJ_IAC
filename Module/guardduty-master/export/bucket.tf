variable guardduty_export_bucket {
    type = string
}

variable s3_accesslog_bucket {
    type = string
}

variable cmk_log_s3 {
    type = string
}

resource "aws_s3_bucket" "guardduty_export_bucket" {
    bucket = var.guardduty_export_bucket
    acl = "private"
    versioning { enabled = true }
    lifecycle_rule {
        id = "90Days"
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
        target_prefix = "${var.guardduty_export_bucket}/"
    }

    force_destroy = true

    depends_on = [
        aws_s3_bucket.s3_accesslog_bucket
    ]
}

resource "aws_s3_bucket_policy" "guardduty_export_bucket_policy" {
    bucket = aws_s3_bucket.guardduty_export_bucket.id

    depends_on = [
        aws_s3_bucket.guardduty_export_bucket
    ]

    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Allow GuardDuty to use the getBucketLocation operation",
            "Effect": "Allow",
            "Principal": {
                "Service": "guardduty.amazonaws.com"
            },
            "Action": "s3:GetBucketLocation",
            "Resource": "arn:aws:s3:::${var.guardduty_export_bucket}"
        },
        {
            "Sid": "Allow GuardDuty to upload objects to the bucket",
            "Effect": "Allow",
            "Principal": {
                "Service": "guardduty.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.guardduty_export_bucket}/*"
        },
        {
            "Sid": "Deny unencrypted object uploads. This is optional",
            "Effect": "Deny",
            "Principal": {
                "Service": "guardduty.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.guardduty_export_bucket}/*",
            "Condition": {
                "StringNotEquals": {
                    "s3:x-amz-server-side-encryption": "aws:kms"
                }
            }
        },
        {
            "Sid": "Deny incorrect encryption header. This is optional",
            "Effect": "Deny",
            "Principal": {
                "Service": "guardduty.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.guardduty_export_bucket}/*",
            "Condition": {
                "StringNotEquals": {
                    "s3:x-amz-server-side-encryption-aws-kms-key-id": "${var.cmk_log_s3}"
                }
            }
        },
        {
            "Sid": "Require SSL",
            "Effect": "Deny",
            "Principal": {
              "AWS": "*"
            },
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::${var.guardduty_export_bucket}/*",
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "false"
                }
            }
        }
    ]
}
EOF
}

resource "aws_s3_bucket" "s3_accesslog_bucket" {
    bucket = var.s3_accesslog_bucket
    acl = "log-delivery-write"
    versioning { enabled = true }
    lifecycle_rule {
        id = "30Days"
        enabled = true

        expiration { days = 30 } # 1 months
    }
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm     = "AES256"
            }
        }
    }
    logging {
        target_bucket = var.s3_accesslog_bucket
        target_prefix = "${var.s3_accesslog_bucket}/"
    }

    force_destroy = true
}

resource "aws_s3_bucket_policy" "s3_accesslog_bucket" {
    bucket = aws_s3_bucket.s3_accesslog_bucket.id
    depends_on = [
        aws_s3_bucket.s3_accesslog_bucket
    ]

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Require SSL",
            "Effect": "Deny",
            "Principal": {
              "AWS": "*"
            },
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::${var.s3_accesslog_bucket}/*",
            "Condition": {
              "Bool": {
                "aws:SecureTransport": "false"
              }
            }
        }
    ]
}
EOF
}
