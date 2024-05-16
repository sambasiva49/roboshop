module "database_servers" {
  for_each = var.database_servers
  source = ""
  component_name = each.value["name"]

  env            = var.env
  instance_type  = each.value["instance_type"]
  password       = lookup(each.value,"password", "null")
  provisioner = true
  app_type = "db"
}

module "app_servers" {
  depends_on = [module.database_servers]
  for_each = var.app_servers
  source = ""
  component_name = each.value["name"]

  env            = var.env
  instance_type  = each.value["instance_type"]
  password       = lookup(each.value,"password", "null")
  provisioner = true
  app_type = "app"


}

## app servers  always depends on database servers this means first run the data bases then application servers