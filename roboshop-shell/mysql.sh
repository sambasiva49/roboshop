
script=${realpath "$0"}
script_path={dirname "$script"}
source ${script_path}/common.sh

echo -e "\e[36m>>>>>>>>disable nodejs<<<<<<<<<\e[0m"

dnf module disable mysql -y
echo -e "\e[36m>>>>>>>>copy the application <<<<<<<<<\e[0m"

cp ${script_path}/mysql.repo /etc/yum.repos.d/mysql.repo

echo -e "\e[36m>>>>>>>>install mysql<<<<<<<<<\e[0m"

dnf install mysql-community-server -y

echo -e "\e[36m>>>>>>>>enable my mysql <<<<<<<<<\e[0m"

systemctl enable mysqld
echo -e "\e[36m>>>>>>>> Restart Mysql<<<<<<<<<\e[0m"

systemctl restart mysqld
echo -e "\e[36m>>>>>>>> Mysql password <<<<<<<<<\e[0m"

mysql_secure_installation --set-root-pass RoboShop@1
echo -e "\e[36m>>>>>>>> Mysql 2nd password <<<<<<<<<\e[0m"

mysql -uroot -pRoboShop@1
