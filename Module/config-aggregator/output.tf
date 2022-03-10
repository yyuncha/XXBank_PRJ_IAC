output config_configuration_recorder{
    value = aws_config_configuration_recorder.config_configuration_recorder.id
}

output aggregator {
    value = aws_config_configuration_aggregator.aggregator.arn
}

output config_bucket {
    value = aws_s3_bucket.config_bucket.arn
}