echo -e "\e[36m>>>>>>>>disable nodejs<<<<<<<<<\e[0m"


dnf module disable nodejs -y
echo -e "\e[36m>>>>>>>>enable nodejs<<<<<<<<<\e[0m"

dnf module enable nodejs:18 -y
echo -e "\e[36m>>>>>>>>install nodejs<<<<<<<<<\e[0m"

dnf install nodejs -y
echo -e "\e[36m>>>>>>>> add Application user <<<<<<<<<\e[0m"

useradd roboshop
echo -e "\e[36m>>>>>>>>Create Application Directory <<<<<<<<<\e[0m"
rm -rf /app

mkdir /app

echo -e "\e[36m>>>>>>>> Download App Content<<<<<<<<<\e[0m"

curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app

echo -e "\e[36m>>>>>>>> unzip App Content <<<<<<<<<\e[0m"

unzip /tmp/user.zip
cd /app

echo -e "\e[36m>>>>>>>>Install nodejs<<<<<<<<<\e[0m"

npm install

echo -e "\e[36m>>>>>>>> Copy systemd File<<<<<<<<<\e[0m"

cp /home/centos/roboshop/roboshop-shell/user.service /etc/systemd/system/user.service

systemctl daemon-reload
systemctl enable user
echo -e "\e[36m>>>>>>>>Restart the user<<<<<<<<<\e[0m"

systemctl restart user

echo -e "\e[36m>>>>>>>> Copy Mongo repo<<<<<<<<<\e[0m"


cp /home/centos/roboshop/roboshop-shell/mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[36m>>>>>>>> Install Mongod Client  <<<<<<<<<\e[0m"

dnf install mongodb-org-shell -y
mongo --host mongodb-dev.sambadevops.online </app/schema/user.js

