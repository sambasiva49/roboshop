echo -e "\e[36m>>>>>>>>Install Redis<<<<<<<<<\e[0m"

dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y

echo -e "\e[36m>>>>>>>>Enable Redis <<<<<<<<<\e[0m"

dnf module enable redis:remi-6.2 -y

echo -e "\e[36m>>>>>>>>Install Redis<<<<<<<<<\e[0m"

dnf install redis -y
# i need to edit two files here
##You can edit file by using vim /etc/redis.conf & vim /etc/redis/redis.conf
systemctl enable redis
echo -e "\e[36m>>>>>>>>Restart the Redis<<<<<<<<<\e[0m"

systemctl restart redis