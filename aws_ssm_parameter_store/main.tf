resource "aws_ssm_parameter" "parameters" {
  count = length(var.parameters)
  name  = var.parameters[count.index].name
  value = var.parameters[count.index].value
  type = "String"
  key_id = ""
}


resource "aws_ssm_parameter" "passwords" {
  count = length(var.pasawords)
  name  = var.passwords[count.index].name
  value = var.passwords[count.index].value
  type = "SecureString"
  key_id = ""
}
