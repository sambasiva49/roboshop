data "aws_security_group" "selected" {
  name = "allow_all1"
}

output "aws_security_group_id" {
  value = data.aws_security_group.selected.id
}