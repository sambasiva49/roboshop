 module "vpc" {
    source = "git::https://github.com/sambasiva49/roboshop.git/tf-module-vpc"

for_each = var.vpc
   cidr_block = each.value["cidr_block"]
 }