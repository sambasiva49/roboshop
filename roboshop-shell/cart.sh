
echo -e "\e[36m>>>>>>>>disable nodejs<<<<<<<<<\e[0m"

dnf module disable nodejs -y

echo -e "\e[36m>>>>>>>>enable  nodejs<<<<<<<<<\e[0m"

dnf module enable nodejs:18 -y
echo -e "\e[36m>>>>>>>>Install nodejs<<<<<<<<<\e[0m"

dnf install nodejs -y
echo -e "\e[36m>>>>>>>> Adding user<<<<<<<<<\e[0m"

useradd roboshop

echo -e "\e[36m>>>>>>>> Creating Directory<<<<<<<<<\e[0m"

mkdir /app

echo -e "\e[36m>>>>>>>> Download project<<<<<<<<<\e[0m"

curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app

echo -e "\e[36m>>>>>>>> Unzip cart <<<<<<<<<\e[0m"

unzip /tmp/cart.zip
cd /app

echo -e "\e[36m>>>>>>>> npm install<<<<<<<<<\e[0m"

npm install

echo -e "\e[36m>>>>>>>> copy the directory <<<<<<<<<\e[0m"


cp /home/centos/roboshop/roboshop-shell/cart.service /etc/systemd/system/cart.service
echo -e "\e[36m>>>>>>>>reload nodejs<<<<<<<<<\e[0m"

systemctl daemon-reload
systemctl enable cart
echo -e "\e[36m>>>>>>>> Restart server<<<<<<<<<\e[0m"

systemctl restart cart
