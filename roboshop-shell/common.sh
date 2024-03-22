app_user=roboshop

script=${realpath "$0"}
script_path={dirname "$script"}
fun_nodejs(){

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