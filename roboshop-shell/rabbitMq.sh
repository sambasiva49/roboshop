

script=${realpath "$0"}
script_path={dirname "$script"}
source ${script_path}/common.sh
my_rabbit_root_password=$1

  if [ -z "$my_rabbit_root_password" ]; then
    echo "roboshop password is missing"
       exit
    fi
echo -e "\e[36m>>>>>>>>   download erlang  <<<<<<<<<\e[0m"

curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash
echo -e "\e[36m>>>>>>>>  setup rabbit mq   <<<<<<<<<\e[0m"

curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash

 echo -e "\e[36m>>>>>>>>  Install rabbit mq   <<<<<<<<<\e[0m"

dnf install rabbitmq-server -y
echo -e "\e[36m>>>>>>>>  enable  rabbit mq   <<<<<<<<<\e[0m"

systemctl enable rabbitmq-server
systemctl start rabbitmq-server

echo -e "\e[36m>>>>>>>>   set up user   <<<<<<<<<\e[0m"

rabbitmqctl add_user roboshop {my_rabbit_root_password}
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
