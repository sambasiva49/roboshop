script=${realpath "$0"}
script_path={dirname "$script"}
source ${script_path}/common.sh


echo -e "\e[36m>>>>>>>>disable nodejs<<<<<<<<<\e[0m"
dnf module disable nodejs -y
echo -e "\e[36m>>>>>>>>enable nodejs<<<<<<<<<\e[0m"


dnf module enable nodejs:18 -y

echo -e "\e[36m>>>>>>>>install nodejs<<<<<<<<<\e[0m"

dnf install nodejs -y
echo -e "\e[36m>>>>>>>> add Application user <<<<<<<<<\e[0m"

useradd ${app_user}

echo -e "\e[36m>>>>>>>>Create Application Directory <<<<<<<<<\e[0m"
rm -rf /app
mkdir /app

echo -e "\e[36m>>>>>>>> Download App Content<<<<<<<<<\e[0m"

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app

echo -e "\e[36m>>>>>>>> unzip App Content <<<<<<<<<\e[0m"

unzip /tmp/catalogue.zip
cd /app

echo -e "\e[36m>>>>>>>>Install nodejs<<<<<<<<<\e[0m"

npm install
echo -e "\e[36m>>>>>>>> Copy systemd File<<<<<<<<<\e[0m"

cp ${script_path}/catalogue.service /etc/systemd/system/catalogue.service

echo -e "\e[36m>>>>>>>> Start Catalogue Service  <<<<<<<<<\e[0m"

systemctl daemon-reload
systemctl enable catalogue
systemctl restart catalogue
echo -e "\e[36m>>>>>>>> Copy Mongo repo<<<<<<<<<\e[0m"


cp ${script_path}/mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[36m>>>>>>>> Install Mongod Client  <<<<<<<<<\e[0m"

dnf install mongodb-org-shell -y
mongo --host mongodb-dev.sambadevops.online </app/schema/catalogue.js
