dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
dnf module enable redis:remi-6.2 -y
dnf install redis -y
# i need to edit two files here
##You can edit file by using vim /etc/redis.conf & vim /etc/redis/redis.conf
systemctl enable redis
systemctl start redis