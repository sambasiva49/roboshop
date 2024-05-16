resource "aws_instance" "instance" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = var.component_name
  }
}


resource "null_resource" "provisioner" {
  depends_on = [ aws_instance.instance, aws_route53_record.records]
  triggers = {
    private_ip = aws_instance.instance.private_ip
  }
  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     =  "centos"
      password = "DevOps321"
      host     = aws_instance.instance.private_ip
    }
    inline = var.app_type == "db" ? local.db_commands : local.app_commands

}
}

resource "aws_iam_role" "test_role" {
  name = "${var.component_name}-${var.env}-role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "${var.component_name}-${var.env}-role"
  }
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = aws_iam_role.role.name
}


resource "aws_iam_role_policy" "ssm_ps_policy" {
  name = "${var.component_name}-${var.env}-ssm_ps_policy"
  role = aws_iam_role.role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

# application servers runs on ansible database servers we want to run the provisioner
## if it is true 1 value otherwise 0 value


#whenever run this code get created role in aws
#then you need to create policy in aws for that go to policy which is there in right hand side of qws role and clic create
#create policy >select a service.systems manager.click on systems manager >search parameters in search bar then you will get some options
#select describe the parameters ,get parameters ,get parameter,get parameterhistory,get parameterbypath>add arn>this account>region<--- us-east-1
#parameternmae <----- dev.frontend.*>add arn button