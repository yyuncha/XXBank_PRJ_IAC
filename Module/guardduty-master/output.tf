output guardduty_primary{
    value = aws_guardduty_detector.sec.id
}

output guardduty_member_prd{
    value = aws_guardduty_member.prd.id
}
/*
output guardduty_member_stg{
    value = aws_guardduty_member.stg.id
}
*/
/*
output guardduty_member_dev{
    value = aws_guardduty_member.dev.id
}
*/
output guardduty_member_ntw{
    value = aws_guardduty_member.ntw.id
}
/*
output guardduty_member_shd{
    value = aws_guardduty_member.shd.id
}
*/
output guardduty_member_log{
    value = aws_guardduty_member.log.id
}

output guardduty_member_iam{
    value = aws_guardduty_member.iam.id
}