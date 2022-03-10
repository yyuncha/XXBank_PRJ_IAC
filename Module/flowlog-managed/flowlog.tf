variable vpc { 
    type = string
}

variable flowlog_name { 
    type = string
}

variable tags {
    type = map
}

resource "aws_flow_log" "flow_log" {
    log_destination = aws_s3_bucket.flowlog_bucket.arn
    log_destination_type = "s3"
    traffic_type = "ALL"
    vpc_id = var.vpc
    tags = merge({"Name" = var.flowlog_name}, var.tags)

    depends_on = [
        aws_s3_bucket.flowlog_bucket,
        aws_s3_bucket_policy.flowlog_bucket_policy
    ]
}