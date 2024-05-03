resource "aws_instance" "instance" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = var.component_name
  }
}


resource "null_resource" "provisioner" {
  count = var.provisioner ? 1 : 0
  depends_on = [ aws_instance.instance, aws_route53_record.records]
  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     =  "centos"
      password = "DevOps321"
      host     = aws_instance.instance.private_ip
    }
    inline = [
      "rm -rf roboshop_shell",
      "git clone https://github.com/sambasiva49/roboshop.git",
      "cd roboshop-shell",
      "sudo bash ${var.component_name}.sh ${var.password}"
    ]
  }
}
}


# application servers runs on ansible database servers we want to run the provisioner
## if it is true 1 value otherwise 0 value