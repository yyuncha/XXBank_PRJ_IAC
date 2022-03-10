variable s3_accesslog_bucket {
    type = string
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