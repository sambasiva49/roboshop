variable "sample" {
  default = "hello"
}

output "sample" {
  value = var.sample
}

variable "env" {}

output "env" {
  value = var.env
}

# terrafom will load these files automatically
variable "auto_num1" {}

output "auto_num1" {
  value = var.auto_num1
}