

dnf install maven -y
echo -e "\e[36m>>>>>>>> User add <<<<<<<<<\e[0m"


useradd roboshop
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

cp /home/centos/roboshop/roboshop-shell/shipping.service /etc/systemd/system/shipping.service
systemctl daemon-reload
systemctl enable shipping
echo -e "\e[36m>>>>>>>>  Restart the server  <<<<<<<<<\e[0m"

systemctl restart shipping

echo -e "\e[36m>>>>>>>>  install schema <<<<<<<<<\e[0m"

dnf install mysql -y
echo -e "\e[36m>>>>>>>>  Restart the server  <<<<<<<<<\e[0m"

systemctl restart shipping
