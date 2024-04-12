
script=${realpath "$0"}
script_path={dirname "$script"}
source ${script_path}/common.sh
my_rabbit_root_password=$1

if [ -z "$my_rabbit_root_password" ]; then
    echo "roboshop password is missing"
       exit
    fi


dnf install python36 gcc python3-devel -y
useradd ${app_user}
rm -rf /app
mkdir /app
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip
cd /app
unzip /tmp/payment.zip
cd /app
pip3.6 install -r requirements.txt
sed -i -e "s|my_rabbit_root_password|{my_rabbit_root_password}|" ${script_path}/payment.service
cp ${script_path}/payment.service /etc/systemd/system/payment.service
systemctl daemon-reload
systemctl enable payment
systemctl start payment