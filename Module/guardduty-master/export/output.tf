output guardduty_export_bucket {
    value = aws_s3_bucket.guardduty_export_bucket.arn
}

output s3_accesslog_bucket{
    value = aws_s3_bucket.s3_accesslog_bucket.arn
}