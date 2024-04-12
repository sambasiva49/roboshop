
script=${realpath "$0"}
script_path={dirname "$script"}
source ${script_path}/common.sh
my_sql_root_password=$1
if [ -z "$my_sql_root_password" ]; then
    echo "roboshop my sql password is missing"
       exit
    fi

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

mysql_secure_installation --set-root-pass ${my_sql_root_password}
echo -e "\e[36m>>>>>>>> Mysql 2nd password <<<<<<<<<\e[0m"

mysql -uroot -p${my_sql_root_password}
