echo -e "\e[32m installing python server\e[0m"
yum install python36 gcc python3-devel -y
echo -e "\e[32m adding user and location\e[0m"
useradd roboshop
mkdir /app
cd /app
echo -e "\e[32m downloading new content and dependencies to payment server\e[0m"
curl -O https://roboshop-artifacts.s3.amazonaws.com/payment.zip
unzip payment.zip &>>/tmp/payment.log
pip3.6 install -r requirements.txt
echo -e "\e[32m creating payment service\e[0m"
cp /root/repo-shell/payment.service /etc/systemd/system/payment.service
echo -e "\e[32m enabling and starting payment service\e[0m"
systemctl daemon-reload
systemctl enable payment
systemctl restart payment
