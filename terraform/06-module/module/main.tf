resource "null_resource" "nothing" {
  provisioner "local-exec" {
    command = "hellow world"
  }
}