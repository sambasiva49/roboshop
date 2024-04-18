data "aws_ami" "centos" {
  owner = ['973714476881']
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
}

output "ami" {
  value = data.aws_ami.centos.image_id

}

#variable "instance_type" {
#  default = "t3.micro"
#
#
#}

data "aws_security_group" "allow_all" {
  name = "allow_all1"
}

variable "components" {
  default = {
    frontend = {
      name = "frontend"
      instance_type = "t3.small"
    }

    mongodb = {
      name = "mongodb"
      instance_type = "t3.small"
    }

    catalogue = {
      name = "catalogue"
      instance_type = "t3.small"
    }

    user = {
      name = "user"
      instance_type = "t3.small"
    }
      cart = {
      name = "cart"
      instance_type = "t3.small"
    }
    mysql = {
      name = "cart"
      instance_type = "t3.small"
    }
    redis = {
      name = "redis"
      instance_type = "t3.small"
    }
    rabbitmq = {
      name = "rabbitmq"
      instance_type = "t3.small"
    }
    shipping = {
      name = "shipping"
      instance_type = "t3.small"
    }
    payment = {
      name = "payment"
      instance_type = "t3.small"
    }
  }
}


resource "aws_instance" "instance" {
  for_each = var.components
  ami           = data.aws_ami.centos.image_id

  instance_type = each.key["instance_type"]
  vpc_security_group_ids = [data.aws_security_group.allow_all.id]

  tags = {
    Name = each.value["name"]
  }
}

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
