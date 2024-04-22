terraform {
  backend "s3" {

    bucket         = sambadevops
    key            = "roboshop/dev/terrafrom.tfstate"
    region         = "us-east-1"

  }
}
