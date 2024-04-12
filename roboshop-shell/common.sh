app_user=roboshop

script=${realpath "$0"}
script_path={dirname "$script"}

cp ${script_path}/mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[36m>>>>>>>> Install Mongod Client  <<<<<<<<<\e[0m"

dnf install mongodb-org-shell -y
mongo --host mongodb-dev.sambadevops.online </app/schema/{component}.js
#fun_nodejs(){

  #print_head(){
   # echo -e "\e[36m>>>>>>>>disable nodejs<<<<<<<<<\e[0m"

echo -e "\e[36m>>>>>>>>disable nodejs<<<<<<<<<\e[0m"

dnf module disable nodejs -y

echo -e "\e[36m>>>>>>>>enable  nodejs<<<<<<<<<\e[0m"

dnf module enable nodejs:18 -y
echo -e "\e[36m>>>>>>>>Install nodejs<<<<<<<<<\e[0m"

dnf install nodejs -y
echo -e "\e[36m>>>>>>>> Adding user<<<<<<<<<\e[0m"

useradd ${app_user}

echo -e "\e[36m>>>>>>>> Creating Directory<<<<<<<<<\e[0m"

mkdir /app

echo -e "\e[36m>>>>>>>> Download project<<<<<<<<<\e[0m"

curl -L -o /tmp/{component}.zip https://roboshop-artifacts.s3.amazonaws.com/{component}.zip
cd /app

echo -e "\e[36m>>>>>>>> Unzip cart <<<<<<<<<\e[0m"

unzip /tmp/{component}.zip
cd /app

echo -e "\e[36m>>>>>>>> npm install<<<<<<<<<\e[0m"

npm install

echo -e "\e[36m>>>>>>>> copy the directory <<<<<<<<<\e[0m"


cp ${script_path}/{component}.service /etc/systemd/system/{component}.service
echo -e "\e[36m>>>>>>>>reload nodejs<<<<<<<<<\e[0m"

systemctl daemon-reload
systemctl enable {component}
echo -e "\e[36m>>>>>>>> Restart server<<<<<<<<<\e[0m"

systemctl restart {component}
}

useradd ${app_user}
rm -rf /app
echo -e "\e[36m>>>>>>>> Creating Directroy <<<<<<<<<\e[0m"

mkdir /app

echo -e "\e[36m>>>>>>>> Download shipping <<<<<<<<<\e[0m"

curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app

echo -e "\e[36m>>>>>>>> unzip the folder <<<<<<<<<\e[0m"

unzip /tmp/shipping.zip
cd /app
echo -e "\e[36m>>>>>>>> clean the package <<<<<<<<<\e[0m"

mvn clean package
echo -e "\e[36m>>>>>>>> Move target <<<<<<<<<\e[0m"

mv target/shipping-1.0.jar shipping.jar
echo -e "\e[36m>>>>>>>> copy folder <<<<<<<<<\e[0m"

cp ${script_path}/shipping.service /etc/systemd/system/shipping.service
systemctl daemon-reload
systemctl enable shipping
echo -e "\e[36m>>>>>>>>  Restart the server  <<<<<<<<<\e[0m"

systemctl restart shipping

echo -e "\e[36m>>>>>>>>  install schema <<<<<<<<<\e[0m"

dnf install mysql -y
echo -e "\e[36m>>>>>>>>  Restart the server  <<<<<<<<<\e[0m"

systemctl restart shipping
