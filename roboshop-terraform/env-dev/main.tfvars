
app_servers = {
frontend = {
  name = "frontend"
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

shipping = {
  name = "shipping"
  instance_type = "t3.small"
  password = "Roboshop@1"
}
payment = {
  name = "payment"
  instance_type = "t3.small"
  password = "roboshop123"
}
}

env = "dev"

database_servers = {
  mysql = {
    name = "cart"
    instance_type = "t3.small"
    password = "Roboshop@1"
  }
  redis = {
    name = "redis"
    instance_type = "t3.small"
  }
  mongodb = {
    name = "mongodb"
    instance_type = "t3.small"
  }
  rabbitmq = {
    name = "rabbitmq"
    instance_type = "t3.small"
    password = "roboshop123"
  }
}