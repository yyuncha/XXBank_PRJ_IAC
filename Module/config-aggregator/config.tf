variable config_recorder {
    type = string
}

variable config_role {
    type = string
}

variable config_aggregator {
    type = string
    default = null
}

resource "aws_config_configuration_aggregator" "aggregator" {
    name = var.config_aggregator

    account_aggregation_source {
        account_ids = [
            local.log,
            local.ntw,
            local.iam,
            local.prd
        ]
        regions     = [ data.aws_region.current.name ]  
    }
}

resource "aws_iam_role" "config_role" {
    name = var.config_role
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "config.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "config_policy" {
    role = aws_iam_role.config_role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}

resource "aws_config_configuration_recorder" "config_configuration_recorder" {
    name = var.config_recorder
    role_arn = aws_iam_role.config_role.arn
}

resource "aws_config_delivery_channel" "config" {
    name = var.config_recorder
    s3_bucket_name = aws_s3_bucket.config_bucket.id
    snapshot_delivery_properties {
        delivery_frequency = "Three_Hours"
    }

    depends_on = [
        aws_s3_bucket.config_bucket,
        aws_s3_bucket_policy.config_bucket_policy,
        aws_config_configuration_recorder.config_configuration_recorder
    ]
}

resource "aws_config_configuration_recorder_status" "config_recorder_status" {
    name = aws_config_configuration_recorder.config_configuration_recorder.id
    is_enabled = true

    depends_on = [
        aws_config_configuration_recorder.config_configuration_recorder,
        aws_config_delivery_channel.config
    ]
}