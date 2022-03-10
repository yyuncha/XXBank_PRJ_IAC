variable Security_Account_id {
    type = string
}

resource "aws_guardduty_detector" "member" {
    enable = true
}

resource "aws_guardduty_invite_accepter" "guardduty_member" {
    detector_id       = aws_guardduty_detector.member.id
    master_account_id = var.Security_Account_id

    depends_on = [
        aws_guardduty_detector.member
    ]
}