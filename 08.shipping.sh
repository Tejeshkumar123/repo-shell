echo -e "\e[32m installing maven server\e[0m"
yum install maven -y
echo -e "\e[32m adding user and location\e[0m"
useradd roboshop
mkdir /app
cd /app
echo -e "\e[32m downloading new content to shipping service\e[0m"
curl -O https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
unzip shipping.zip
echo -e "\e[32m downloading dependencies and building application to shipping\e[0m"
mvn clean package
mv target/shipping-1.0.jar shipping.jar
echo -e "\e[32m creating shipping service file\e[0m"
cp /root/repo-shell/shipping.service /etc/systemd/system/shipping.service
echo -e "\e[32m downloading and installing mysql schema\e[0m"
yum install mysql -y
mysql -h mysql-dev.sindhu.cloud -uroot -pRoboShop@1 </app/schema/shipping.sql
echo -e "\e[32m enabling and restarting the shipping service\e[0m"
systemctl daemon-reload
systemctl enable shipping
systemctl restart shipping
