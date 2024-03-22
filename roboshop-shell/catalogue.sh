script=${realpath "$0"}
script_path={dirname "$script"}
source ${script_path}/common.sh

component=catalogue
fun_nodejs

cp ${script_path}/mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[36m>>>>>>>> Install Mongod Client  <<<<<<<<<\e[0m"

dnf install mongodb-org-shell -y
mongo --host mongodb-dev.sambadevops.online </app/schema/catalogue.js
