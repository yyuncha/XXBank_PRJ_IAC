variable cloudtrail_name {
    type = string
}

resource "aws_cloudtrail" "cloudtrail_name" {
    name = var.cloudtrail_name
    s3_bucket_name = aws_s3_bucket.cloudtrail_bucket.id

    depends_on = [
        aws_s3_bucket.cloudtrail_bucket,
        aws_s3_bucket_policy.cloudtrail_bucket_policy
    ]
}