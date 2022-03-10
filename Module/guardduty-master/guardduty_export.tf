variable guardduty_export_bucket {
    type = string
}

variable cmk_log_s3 {
    type = string
}

resource "aws_guardduty_publishing_destination" "test" {
    detector_id     = aws_guardduty_detector.sec.id
    destination_arn = var.guardduty_export_bucket
    kms_key_arn     = var.cmk_log_s3
    depends_on = [
        aws_guardduty_detector.sec
    ]
}