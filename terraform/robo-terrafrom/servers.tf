

#output "frontend" {
#  value = aws_instance.frontend.public_ip
#}
#
#resource "aws_instance" "mysql" {
#  ami           = data.aws_ami.centos.image_id
#
#  instance_type = var.instance_type
#
#  vpc_security_group_ids = [data.aws_security_group.allow_all.id]
#
#  tags = {
#    Name = "mysql"
#  }
#}
#
#resource "aws_instance" "mongodb" {
#  ami           = data.aws_ami.centos.image_id
#
#  instance_type = var.instance_type
#
#  vpc_security_group_ids = [data.aws_security_group.allow_all.id]
#
#  tags = {
#    Name = "mongodb"
#  }
#}
#
#resource "aws_instance" "catalogue" {
#  ami           = data.aws_ami.centos.image_id
#
#  instance_type = var.instance_type
#
#  vpc_security_group_ids = [data.aws_security_group.allow_all.id]
#
#  tags = {
#    Name = "catalogue"
#  }
#}
#
#resource "aws_instance" "user" {
#  ami           = data.aws_ami.centos.image_id
#
#  instance_type = var.instance_type
#
#  vpc_security_group_ids = [data.aws_security_group.allow_all.id]
#
#  tags = {
#    Name = "user"
#  }
#}
#
#resource "aws_instance" "cart" {
#  ami           = data.aws_ami.centos.image_id
#
#  instance_type = var.instance_type
#
#  vpc_security_group_ids = [data.aws_security_group.allow_all.id]
#
#  tags = {
#    Name = "cart"
#  }
#}
#
#resource "aws_instance" "redis" {
#  ami           = data.aws_ami.centos.image_id
#
#  instance_type = var.instance_type
#  vpc_security_group_ids = [data.aws_security_group.allow_all.id]
#
#
#  tags = {
#    Name = "redis"
#  }
#}
#
#resource "aws_instance" "shipping" {
#  ami           = data.aws_ami.centos.image_id
#
#  instance_type = var.instance_type
#
#  vpc_security_group_ids = [data.aws_security_group.allow_all.id]
#
#  tags = {
#    Name = "shipping"
#  }
#}
#
#resource "aws_instance" "RabbitMq" {
#  ami           = data.aws_ami.centos.image_id
#
#  instance_type = var.instance_type
#
#  vpc_security_group_ids = [data.aws_security_group.allow_all.id]
#
#  tags = {
#    Name = "RabbitMq"
#  }
#}
#
#resource "aws_instance" "payment" {
#  ami           = data.aws_ami.centos.image_id
#
#  instance_type = var.instance_type
#
#  vpc_security_group_ids = [data.aws_security_group.allow_all.id]
#
#  tags = {
#    Name = "payment"
#  }
#}
