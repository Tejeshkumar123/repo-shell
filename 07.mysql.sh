echo -e "\e[32m disabling mysql defult version\e[0m"
yum module disable mysql -y
echo -e "\e[32m setting mysql repo\e[0m"
cp /root/repo-shell/mysql.repo /etc/yum.repos.d/mysql.repo
echo -e "\e[32m installing mysql server\e[0m"
yum install mysql-community-server -y
echo -e "\e[32m changing defult root password\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1
echo -e "\e[32m enabling and starting mysql server\e[0m"
systemctl enable mysqld
systemctl restart mysqld

