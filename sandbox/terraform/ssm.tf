
resource "aws_ssm_parameters" "ssm_sandbox_parameters"{
    name    = "/accID"
    type    = "String"
    value   = "${data.aws_caller_identity.current.account_id}"
}