variable account_list {
    type = map
}

resource "aws_guardduty_detector" "sec" {
    enable = true
    finding_publishing_frequency = "FIFTEEN_MINUTES"
}

resource "aws_guardduty_member" "prd" {
    account_id  = element(lookup(var.account_list, "prd", [null, null]),0)
    detector_id = aws_guardduty_detector.sec.id
    email = element(lookup(var.account_list, "prd", [null, null]),1)
    invite = true 
}
/*
resource "aws_guardduty_member" "stg" {
    account_id  = element(lookup(var.account_list, "stg", [null, null]),0)
    detector_id = aws_guardduty_detector.sec.id
    email = element(lookup(var.account_list, "stg", [null, null]),1)
    invite = true 
}

resource "aws_guardduty_member" "dev" {
    account_id  = element(lookup(var.account_list, "dev", [null, null]),0)
    detector_id = aws_guardduty_detector.sec.id
    email = element(lookup(var.account_list, "dev", [null, null]),1)
    invite = true 
}
*/
resource "aws_guardduty_member" "ntw" {
    account_id  = element(lookup(var.account_list, "ntw", [null, null]),0)
    detector_id = aws_guardduty_detector.sec.id
    email = element(lookup(var.account_list, "ntw", [null, null]),1)
    invite = true 
}
/*
resource "aws_guardduty_member" "shd" {
    account_id  = element(lookup(var.account_list, "shd", [null, null]),0)
    detector_id = aws_guardduty_detector.sec.id
    email = element(lookup(var.account_list, "shd", [null, null]),1)
    invite = true 
}
*/
resource "aws_guardduty_member" "log" {
    account_id  = element(lookup(var.account_list, "log", [null, null]),0)
    detector_id = aws_guardduty_detector.sec.id
    email = element(lookup(var.account_list, "log", [null, null]),1)
    invite = true 
}

resource "aws_guardduty_member" "iam" {
    account_id  = element(lookup(var.account_list, "iam", [null, null]),0)
    detector_id = aws_guardduty_detector.sec.id
    email = element(lookup(var.account_list, "iam", [null, null]),1)
    invite = true 
}