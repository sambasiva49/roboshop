resource "null_resource" "null" {
  count = length(var.fruits1)


  provisioner "local-exec" {
    command = "each fruit name- ${each.key} - ${each.value}"
  }
}

variable "fruits1" {
        defualt = {
        apple = 10
        oranges = 20
        banana =30
}
}